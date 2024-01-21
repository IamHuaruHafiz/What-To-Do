import 'package:flutter/material.dart';

ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    colorScheme: ColorScheme.light(
      background: Colors.white,
      primary: Colors.blueGrey.shade500,
      secondary: Colors.black12,
    ));
ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    colorScheme: ColorScheme.dark(
      background: Colors.white12,
      primary: Colors.blueGrey.shade900,
      secondary: Colors.white10,
    ));
