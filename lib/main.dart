import 'package:flutter/material.dart';
import 'package:untitled13/ui/home_screen/home_page.dart';
import 'package:untitled13/my_theme.dart';
import 'package:untitled13/ui/auth/login/login_screen.dart';
import 'package:untitled13/ui/auth/register/register.dart';
import 'package:untitled13/ui/tabs/list/widget/List_details.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: HomePage.routeName,
      routes: {
        HomePage.routeName: (context) => HomePage(),
        LoginScreen.routeName: (context) => const LoginScreen(),
        RegisterScreen.routeName: (context) => const RegisterScreen(),
        ListItemDetails.routeName: (context) => const ListItemDetails(),
      },
      theme: MyTheme.myTheme,
    );
  }
}
