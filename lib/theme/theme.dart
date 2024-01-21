import 'package:flutter/material.dart';

ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    appBarTheme: const AppBarTheme(
      color: Colors.blue,
    ),
    colorScheme: const ColorScheme.light(
      background: Colors.white,
      primary: Colors.blue,
    ));
ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    appBarTheme: AppBarTheme(backgroundColor: Colors.blue.shade700),
    colorScheme: ColorScheme.dark(
      background: Colors.black87,
      primary: Colors.blue.shade700,
    ));
