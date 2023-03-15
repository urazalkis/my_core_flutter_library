import 'dart:io' show Platform;

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../../../core/constant/design/color_constant.dart';
import '../../../product/model/user_model.dart';

class SocialAdapterModel {
  final String title;
  final Color color;
  final Icon icon;
  SocialAdapterModel({required this.title, required this.color, required this.icon});
  factory SocialAdapterModel.google() {
    return SocialAdapterModel(
        title: "Google İle Giriş Yap",
        color: ColorConstant.googleColor,
        icon: const Icon(
          FontAwesomeIcons.google,
          color: ColorConstant.googleColor,
        ));
  }
  factory SocialAdapterModel.facebook() {
    return SocialAdapterModel(title: "Facebook İle Giriş Yap", color: ColorConstant.facebookColor, icon: const Icon(FontAwesomeIcons.facebook, color: ColorConstant.facebookColor));
  }
}

abstract class ISocialAdapter {
  late final SocialAdapterModel model;
  Future<UserModel?> login();
  Future<void> signOut();
  Future<bool> checkEmailUser(String email) async {
    final userCollection = FirebaseFirestore.instance.collection('users');
    final result = await userCollection.where('email', isEqualTo: email).get();
    if (result.size != 0 && email.isNotEmpty) {
      return true;
    } else {
      return false;
    }
  }
}

class GoogleAdapter extends ISocialAdapter {
  GoogleSignIn get googleSignIn {
    if (Platform.isIOS) {
      return GoogleSignIn();
    } else {
      return GoogleSignIn();
    }
  }

  @override
  Future<UserModel?> login() async {
    try {
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

      if (await checkEmailUser(googleUser!.email)) {
        // Obtain the auth details from the request
        final GoogleSignInAuthentication googleAuth = await googleUser.authentication;

        // Create a new credential
        final credential = GoogleAuthProvider.credential(
          accessToken: googleAuth.accessToken,
          idToken: googleAuth.idToken,
        );

        // Once signed in, return the UserCredential
        final result = await FirebaseAuth.instance.signInWithCredential(credential);

        return UserModel(
          email: result.user?.email,
          name: result.user?.displayName,
          profilePictureUrl: result.user?.photoURL,
        );
      } else {
        return null;
      }
    } catch (error) {
      throw '$error';
    }
  }

  @override
  SocialAdapterModel model = SocialAdapterModel.google();

  @override
  Future<void> signOut() async {
    await googleSignIn.signOut();
  }
}

/*class FacebookAdapter extends ISocialAdapter {
  @override
  Future<String> login() {
    // TODO: implement fetchResponse
    throw UnimplementedError();
  }

  @override
  SocialAdapterModel model = SocialAdapterModel.facebook();

  @override
  Future<void> signOut() {
    // TODO: implement logout
    throw UnimplementedError();
  }
}*/
