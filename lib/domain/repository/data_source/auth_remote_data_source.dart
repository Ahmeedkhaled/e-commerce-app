import 'package:dartz/dartz.dart';
import 'package:untitled13/domain/entity/auth_result_entity.dart';
import 'package:untitled13/domain/failures.dart';

abstract class AuthRemoteDataSource{
  Future<Either<Failures,AuthResultEntity>> register(String name,String email,String password,String rePassword,String phone);

}