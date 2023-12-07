import 'package:dartz/dartz.dart';
import 'package:untitled13/domain/entity/auth_result_entity.dart';
import 'package:untitled13/domain/failures.dart';
import 'package:untitled13/domain/repository/data_source/auth_remote_data_source.dart';
import 'package:untitled13/domain/repository/repository/auth_repository_contract.dart';

class AuthRepositoryImpl implements AuthRepositoryContract{
  AuthRemoteDataSource authRemoteDataSource;
  AuthRepositoryImpl({required this.authRemoteDataSource});
  @override
  Future<Either<Failures, AuthResultEntity>> register(String name, String email, String password, String rePassword, String phone) {
   return authRemoteDataSource.register(name, email, password, rePassword, phone);
  }

}