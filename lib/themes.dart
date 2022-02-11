import 'package:flutter/material.dart';

class Themes {
  static final primaryColor = Colors.blue.shade300;
  static final primary = Colors.blue;

  static final darkTheme = ThemeData(
    scaffoldBackgroundColor: Colors.grey.shade900,
    primaryColorDark: primaryColor,
    colorScheme: ColorScheme.dark(primary: primary),
    dividerColor: Colors.white,
  );

  static final lightTheme = ThemeData(
    scaffoldBackgroundColor: Colors.white,
    primaryColorLight: primaryColor,
    colorScheme: ColorScheme.light(primary: primary),
    dividerColor: Colors.black,
  );
}
