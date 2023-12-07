import 'package:dartz/dartz.dart';
import 'package:untitled13/domain/entity/auth_result_entity.dart';
import 'package:untitled13/domain/failures.dart';
import 'package:untitled13/domain/repository/repository/auth_repository_contract.dart';

class RegisterUseCase{
  AuthRepositoryContract authRepositoryContract;
  RegisterUseCase({required this.authRepositoryContract});

  Future<Either<Failures, AuthResultEntity>> invoke(String name,String email,String password,String rePassword,String phone){
    return authRepositoryContract.register(name, email, password, rePassword, phone);
  }
}