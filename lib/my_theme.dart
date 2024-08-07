// ignore_for_file: use_full_hex_values_for_flutter_colors

import 'package:flutter/material.dart';

class MyTheme {
  static Color primaryColor = const Color(0xff004182);
  static Color darkPrimaryColor = const Color(0xff06004F);
  static Color whiteColor = const Color(0xffffffff);
  static Color grayColor = const Color(0xff06004f99);

  static ThemeData myTheme = ThemeData(
      appBarTheme: const AppBarTheme(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
          type: BottomNavigationBarType.fixed, unselectedItemColor: whiteColor),
      textTheme: TextTheme(
        titleSmall: const TextStyle(fontSize: 14, color: Colors.grey),
        titleMedium: TextStyle(
            fontSize: 18, color: primaryColor, fontWeight: FontWeight.w500),
      ));
}
