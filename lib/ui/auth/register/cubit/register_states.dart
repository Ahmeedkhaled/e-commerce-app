import 'package:untitled13/domain/entity/auth_result_entity.dart';

abstract class RegisterState{}

class RegisterInitialState extends RegisterState{}
class RegisterLoadingState extends RegisterState{
  String? loadingMessage;
  RegisterLoadingState({required this.loadingMessage});
}
class RegisterErrorState extends RegisterState{
  String? errorMessage;
  RegisterErrorState({required this.errorMessage});
}
class RegisterSuccessState extends RegisterState{
  AuthResultEntity resultEntity;
  RegisterSuccessState({required this.resultEntity});
}