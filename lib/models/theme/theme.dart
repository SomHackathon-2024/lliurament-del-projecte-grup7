import 'package:flutter/material.dart';

ThemeData lightMode = ThemeData(
  brightness: Brightness.light,
  colorScheme: ColorScheme.light(
    brightness: Brightness.light,
    background: Color.fromARGB(255, 242, 246, 254),
    primary: Colors.black87,
    secondary: Color.fromARGB(255, 66, 45, 191),
    primaryContainer: Colors.grey,


    //always the same color (do not change: outline)
    surface: Color.fromARGB(255, 242, 246, 254),

    onBackground: Colors.black87,
    shadow: Colors.white70,
  )
);

ThemeData darkMode = ThemeData(
  brightness: Brightness.dark,
  colorScheme: ColorScheme.dark(
    brightness: Brightness.dark,
    background: Color.fromARGB(255, 0, 0, 0),
    primary: Colors.white,
    secondary: Color.fromARGB(255, 66, 45, 191),
    primaryContainer: Colors.white,

    //always the same color
    surface: Color.fromARGB(255, 242, 246, 254),

    onBackground: Colors.white70,
  )
);