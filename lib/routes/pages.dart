import 'package:flutter/material.dart' show BuildContext, ModalRoute, Widget;
import 'package:tekus/pages/details/details_page.dart';
import 'package:tekus/pages/home/home_page.dart';
import 'package:tekus/routes/routes.dart';

///Contiene el mapa de rutas y la ruta inicial para la navegación nombrada
abstract class Pages {
  static const String INITIAL = AppRoutes.HOME;
  static final Map<String, Widget Function(BuildContext)> routes = {
    AppRoutes.HOME: (_) => HomePage(),
    AppRoutes.DETAILS: (_) {
      final date = ModalRoute.of(_)!.settings.arguments as DateTime;
      return DetailsPage(date: date);
    }
  };
}
