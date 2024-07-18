// ignore_for_file: file_names

import 'package:untitled13/domain/entity/auth_result_entity.dart';

import 'UserDto.dart';

/// message : "success"
/// user : {"name":"Ahmed Abd Al-Muti","email":"ahmedl996@gmail.com","role":"user"}
/// token : "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjY1NGJhMDA4MjE0MWJmMzExZjA0M2JjYiIsIm5hbWUiOiJBaG1lZCBBYmQgQWwtTXV0aSIsInJvbGUiOiJ1c2VyIiwiaWF0IjoxNjk5NDU0OTg1LCJleHAiOjE3MDcyMzA5ODV9.lqqSEeK1D-q8JHQUYJ0kcrOdY09YD1oWxv3cCHNgMOI"

class RegisterResponeDto {
  RegisterResponeDto({
    this.message,
    this.user,
    this.token,
    this.statusMsg,
  });

  RegisterResponeDto.fromJson(dynamic json) {
    message = json['message'];
    statusMsg = json['statusMsg'];
    user = json['user'] != null ? UserDto.fromJson(json['user']) : null;
    token = json['token'];
  }
  String? message;
  UserDto? user;
  String? token;
  String? statusMsg;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['message'] = message;
    map['statusMsg'] = statusMsg;
    if (user != null) {
      map['user'] = user?.toJson();
    }
    map['token'] = token;
    return map;
  }

  AuthResultEntity toAuthResultEntity() {
    return AuthResultEntity(token: token, userEntity: user?.toUserEntity());
  }
}
