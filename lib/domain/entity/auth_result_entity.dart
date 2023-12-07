import 'package:untitled13/domain/entity/UserEntity.dart';

class AuthResultEntity{
  UserEntity? userEntity;
  String? token;
  AuthResultEntity({ this.userEntity, this.token});
}