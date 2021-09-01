import 'package:flutter/material.dart';

abstract class MyThemeDark {
  static final themeDark = ThemeData(
    fontFamily: 'Poppins',
    visualDensity: VisualDensity.adaptivePlatformDensity,
    primarySwatch: Colors.deepPurple,
    brightness: Brightness.dark,
    scaffoldBackgroundColor: Color(0xFF323445),
  );
}
