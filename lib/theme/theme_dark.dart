import 'package:flutter/material.dart';

///Retorna el [ThemeData] en modo dark
abstract class MyThemeDark {
  static final themeDark = ThemeData(
    fontFamily: 'Poppins',
    appBarTheme: AppBarTheme(
      centerTitle: true,
    ),
    visualDensity: VisualDensity.adaptivePlatformDensity,
    primarySwatch: Colors.deepPurple,
    brightness: Brightness.dark,
  );
}
