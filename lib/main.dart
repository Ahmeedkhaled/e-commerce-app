import 'package:flutter/material.dart';
import 'package:untitled13/ui/home_screen/home_page.dart';
import 'package:untitled13/my_theme.dart';
import 'package:untitled13/ui/auth/login/login_screen.dart';
import 'package:untitled13/ui/auth/register/register.dart';

void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: HomePage.routeName,
      routes: {
        HomePage.routeName:(context) => HomePage(),
        LoginScreen.routeName:(context) => LoginScreen(),
        RegisterScreen.routeName:(context) => RegisterScreen(),

      },
      theme: MyTheme.myTheme,
    );
  }

}

