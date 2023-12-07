import 'package:dartz/dartz.dart';
import 'package:untitled13/data/modal/api/api_manager.dart';
import 'package:untitled13/domain/entity/auth_result_entity.dart';
import 'package:untitled13/domain/failures.dart';
import 'package:untitled13/domain/repository/data_source/auth_remote_data_source.dart';

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource{
  ApiManager apiManager;
  AuthRemoteDataSourceImpl({required this.apiManager});
  @override
  Future<Either<Failures, AuthResultEntity>> register(String name, String email, String password,
      String rePassword, String phone) async{
    var either=await apiManager.register(name, email, password, rePassword, phone);
      return  either.fold((l){
          return left(Failures(errorMessage: l.errorMessage));
        }, (r){
          return right(r.toAuthResultEntity());
        });

  }
  
}