import 'package:flutter/material.dart' show Widget, BuildContext;
import 'package:tekus/pages/details/details_page.dart';
import 'package:tekus/pages/home/home_page.dart';
import 'package:tekus/routes/routes.dart';

abstract class Pages {
  static const String INITIAL = AppRoutes.HOME;
  static final Map<String, Widget Function(BuildContext)> routes = {
    AppRoutes.HOME: (_) => HomePage(),
    AppRoutes.DETAILS: (_) => DetailsPage(),
  };
}
