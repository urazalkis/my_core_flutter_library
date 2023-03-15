// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserModel _$UserModelFromJson(Map<String, dynamic> json) => UserModel(
      userName: json['userName'] as String?,
      name: json['name'] as String?,
      password: json['password'] as String?,
      email: json['email'] as String?,
      profilePictureUrl: json['profilePictureUrl'] as String?,
      admin: json['admin'] as bool?,
    );

Map<String, dynamic> _$UserModelToJson(UserModel instance) => <String, dynamic>{
      'userName': instance.userName,
      'name': instance.name,
      'password': instance.password,
      'email': instance.email,
      'profilePictureUrl': instance.profilePictureUrl,
      'admin': instance.admin,
    };
