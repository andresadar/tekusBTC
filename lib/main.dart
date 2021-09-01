import 'package:flutter/material.dart';
import 'package:tekus/theme/theme_dark.dart';

import 'pages/home/home_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Tekus BTC',
      theme: MyThemeDark.themeDark,
      home: HomePage(),
    );
  }
}
