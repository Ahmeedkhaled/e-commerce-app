// ignore_for_file: file_names

import 'package:untitled13/domain/entity/UserEntity.dart';

class UserDto {
  UserDto({
    this.name,
    this.email,
    this.role,
  });

  UserDto.fromJson(dynamic json) {
    name = json['name'];
    email = json['email'];
    role = json['role'];
  }
  String? name;
  String? email;
  String? role;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['name'] = name;
    map['email'] = email;
    map['role'] = role;
    return map;
  }

  UserEntity toUserEntity() {
    return UserEntity(name: name, email: email);
  }
}
