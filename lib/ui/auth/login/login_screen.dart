import 'package:flutter/material.dart';
import 'package:untitled13/ui/home_screen/home_page.dart';
import 'package:untitled13/ui/widget/text_field_item.dart';
import 'package:untitled13/ui/auth/register/register.dart';

class LoginScreen extends StatefulWidget {
  static const String routeName = "login";

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool isObscure = true;

  var formKey = GlobalKey<FormState>();

  var emailController = TextEditingController();

  var passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                    key: formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        TextFieldItem(
                            fieldName: "email",
                            controller: emailController,
                            hintText: "enter Your Name",
                            validator: (value) {
                              if (value == null || value.trim().isEmpty) {
                                return "please enter your email";
                              }
                              bool emailValid = RegExp(
                                  r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                  .hasMatch(value);
                              if (!emailValid) {
                                return "pelese enter valid email";
                              }
                              return null;
                            }),
                        TextFieldItem(
                            suffixIcon: IconButton(
                                onPressed: () {
                                  isObscure = !isObscure;
                                  setState(() {});
                                },
                                icon: isObscure
                                    ? Icon(Icons.visibility_off)
                                    : Icon(Icons.visibility)),
                            keyBoardType: TextInputType.number,
                            fieldName: "Password",
                            IsObscure: isObscure,
                            controller: passwordController,
                            hintText: "enter Your Password",
                            validator: (value) {
                              if (value == null || value.trim().isEmpty) {
                                return "please enter your Password";
                              }
                              if (value.trim().length < 6 ||
                                  value.trim().length > 30) {
                                return "password should be >6&<30";
                              }
                              return null;
                            }),
                        Text(
                          "ForgetPassword",
                          style: TextStyle(fontSize: 15, color: Colors.white),
                          textAlign: TextAlign.end,
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.04,
                        ),
                        ElevatedButton(
                          onPressed: () {
                            validator();
                          },
                          child: Padding(
                            padding: EdgeInsets.all(15.0),
                            child: Text(
                              "Login",
                              style:
                                  TextStyle(color: Colors.blue, fontSize: 18),
                            ),
                          ),
                          style: ButtonStyle(
                            backgroundColor:
                                MaterialStatePropertyAll(Colors.white),
                            shape: MaterialStatePropertyAll(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(12))),
                          ),
                        ),
                        SizedBox(
                          height: 12,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Dont have an account? ",
                              style:
                                  TextStyle(fontSize: 15, color: Colors.white),
                              textAlign: TextAlign.end,
                            ),
                            InkWell(
                              onTap: (){
                                Navigator.of(context).pushNamed(RegisterScreen.routeName);
                              },
                                child: Text(
                              "Create Account?",
                              style:
                                  TextStyle(fontSize: 15, color: Colors.white),
                              textAlign: TextAlign.end,
                            )),
                          ],
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  void validator() {
    if (formKey.currentState!.validate() == true) {
      Navigator.of(context).pushNamed(HomePage.routeName);
    }
  }
}
