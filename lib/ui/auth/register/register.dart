import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled13/dialog_utils.dart';
import 'package:untitled13/domain/di.dart';
import 'package:untitled13/ui/home_screen/home_page.dart';
import 'package:untitled13/ui/auth/register/cubit/register_states.dart';
import 'package:untitled13/ui/auth/register/cubit/reigester_screen_view_modal.dart';
import 'package:untitled13/ui/widget/text_field_item.dart';

class RegisterScreen extends StatefulWidget {
  static const String routeName = "register";

  @override
  State<RegisterScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<RegisterScreen> {
  RegisterScreenViewModal viewModal=RegisterScreenViewModal(registerUseCase: injectRegisterUseCase());
  @override
  Widget build(BuildContext context) {
    return BlocListener<RegisterScreenViewModal,RegisterState>(
      bloc: viewModal,
      listener: (context, state) {
        if(state is RegisterLoadingState){
          DialogUtils.showLoading(context, state.loadingMessage??"Waiting");
        }else if(state is RegisterErrorState){
          DialogUtils.hideLoading(context);
          DialogUtils.showMessage(context,state.errorMessage??"",title:"Error",posActionName: "ok");
        }else if(state is RegisterSuccessState){
          DialogUtils.hideLoading(context);
          DialogUtils.showMessage(context,"Register",title:"Successfully",posActionName: "ok",posAction: (){
            Navigator.of(context).pushNamed(HomePage.routeName);
          });
        }
      },
      child:
      Scaffold(
        backgroundColor: Colors.blue,
        body: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Center(
                    child: Text(
                      "Route",
                      style: TextStyle(
                          fontSize: 70,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 12),
                    child: Text(
                      "Welcome Back To Route",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                      ),
                    ),
                  ),
                  Text(
                    "Please sign in with yout mail",
                    style: TextStyle(
                      color: Colors.white70,
                      fontSize: 14,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 20.0),
                    child: Form(
                      key: viewModal.formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          TextFieldItem(
                              fieldName: "Full Name ",
                              controller: viewModal.fullNameController,
                              hintText: "enter Your Name",
                              validator: (value){
                                if(value==null||value.trim().isEmpty){
                                  return "please enter your name";
                                }
                                return null;
                              }
                              ),
                          TextFieldItem(
                              fieldName: "email",
                              controller: viewModal.emailController,
                              hintText: "enter Your email",
                              keyBoardType: TextInputType.emailAddress,
                              validator: (value){
                                if(value==null||value.trim().isEmpty){
                                  return "please enter your email";
                                }
                                bool emailValid = RegExp(
                                    r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                    .hasMatch(value);
                                if (!emailValid) {
                                  return "please enter valid email";
                                }
                                return null;
                              }
                              ),
                          TextFieldItem(
                            suffixIcon: IconButton(onPressed: (){
                              viewModal.isObscure=!viewModal.isObscure;
                              setState(() {

                              });

                            }, icon: viewModal.isObscure?Icon(Icons.visibility_off):Icon(Icons.visibility)),
                            keyBoardType: TextInputType.number,
                              fieldName: "Password",
                              IsObscure:viewModal.isObscure ,
                              controller: viewModal.passwordController,
                              hintText: "enter Your Password",
                              validator: (value){
                                if(value==null||value.trim().isEmpty){
                                  return "please enter your Password";
                                }
                                if(value.trim().length<6||value.trim().length>30){
                                  return "password should be >6&<30";
                                }
                                return null;
                              }
                              ),
                          TextFieldItem(
                            suffixIcon: IconButton(onPressed: (){
                              viewModal.isObscure=!viewModal.isObscure;
                              setState(() {

                              });

                            }, icon: viewModal.isObscure?Icon(Icons.visibility_off):Icon(Icons.visibility)),
                            keyBoardType: TextInputType.number,
                              fieldName: "confirmationPassword",
                              IsObscure:viewModal.isObscure ,
                              controller: viewModal.confirmationPasswordController,
                              hintText: "enter Your confirmationPassword",
                              validator: (value){
                                if(value==null||value.trim().isEmpty){
                                  return "please enter your confirmationPassword";
                                }
                                if(value.trim().length<6||value.trim().length>30){
                                  return "confirmationPassword should be >6&<30";
                                }
                                if (value != viewModal.passwordController.text) {
                                  return "confirmPassword doesn't match";
                                }
                                return null;
                              }
                              ),
                          TextFieldItem(
                            keyBoardType: TextInputType.number,
                              fieldName: "Phone Number",
                              controller: viewModal.numberController,
                              hintText: "enter Your Phone",
                              validator: (value){
                                if(value==null||value.trim().isEmpty){
                                  return "please enter your phone";
                                }
                                if(value.trim().length<11||value.trim().length>11){
                                  return "password should be 11";
                                }
                                return null;
                              }
                              ),
                          SizedBox(height: 20,),
                          ElevatedButton(
                              onPressed: (){
                                viewModal.register();
                              },
                              child:Padding(
                                padding:  EdgeInsets.all(15.0),
                                child: Text("Sign Up",style: TextStyle(
                                  color: Colors.blue,
                                  fontSize: 18
                                ),),
                              ),
                            style: ButtonStyle(
                              backgroundColor: MaterialStatePropertyAll(
                                Colors.white
                              ),
                              shape: MaterialStatePropertyAll(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12)
                                )
                              ),

                            ),

                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
  }

