import 'package:json_annotation/json_annotation.dart';

part 'user_model.g.dart';

@JsonSerializable()
class UserModel {
  final String? userName;
  final String? name;
  final String? password;
  final String? email;
  final String? profilePictureUrl;
  final bool? admin;
  UserModel({this.userName, this.name, this.password, this.email, this.profilePictureUrl, this.admin});

  factory UserModel.fromJson(Map<String, dynamic> json) => _$UserModelFromJson(json);
  Map<String, dynamic> toJson() => _$UserModelToJson(this);
}
