import 'package:flutter/material.dart';

import 'package:tekus/routes/pages.dart';
import 'package:tekus/theme/theme_dark.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Tekus BTC',
      theme: MyThemeDark.themeDark,
      initialRoute: Pages.INITIAL,
      routes: Pages.routes,
    );
  }
}
