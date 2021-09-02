import 'dart:math';

import 'package:flutter/material.dart';

///Retorna una animación cada 60 segundos para indicar al usuario cuanto falta
///para la siguiente actualización del precio BTC
class CirlceAnimation extends StatelessWidget {
  CirlceAnimation({
    Key? key,
  }) : super(key: key);

  final Random random = Random();

  @override
  Widget build(BuildContext context) {
    return FittedBox(
      child: Container(
        key: Key(
          random.nextInt(100).toString(),
        ),
        child: TweenAnimationBuilder(
          tween: Tween(begin: 0.0, end: 1.0),
          duration: const Duration(seconds: 60),
          builder: (context, double value, child) {
            return CircularProgressIndicator(
              value: value,
              backgroundColor: Colors.white10,
              strokeWidth: 2,
            );
          },
        ),
      ),
    );
  }
}
