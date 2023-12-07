import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled13/domain/use_case/register_use_case.dart';
import 'package:untitled13/ui/auth/register/cubit/register_states.dart';

class RegisterScreenViewModal extends Cubit<RegisterState>{
  RegisterUseCase registerUseCase;

  RegisterScreenViewModal({required this.registerUseCase}):super(RegisterInitialState());

  bool isObscure=true;

  var formKey=GlobalKey<FormState>();
  var emailController=TextEditingController();
  var fullNameController=TextEditingController();
  var passwordController=TextEditingController();
  var confirmationPasswordController=TextEditingController();
  var numberController=TextEditingController();
  void register()async{
    if(formKey.currentState?.validate()==true){
      emit(RegisterLoadingState(loadingMessage: "loading..."));
     var either=await registerUseCase.invoke(fullNameController.text, emailController.text, passwordController.text
          , confirmationPasswordController.text, numberController.text);
     either.fold((l) {
       emit(RegisterErrorState(errorMessage: l.errorMessage));
     }, (r){
       emit(RegisterSuccessState(resultEntity: r));
     });
    }
  }

}