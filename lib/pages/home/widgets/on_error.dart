import 'package:flutter/material.dart';

///Retorna un widget con un [TextButton] que permite refrescar el widget padre
class ErrorWidget extends StatelessWidget {
  const ErrorWidget({Key? key, required this.callback}) : super(key: key);

  final VoidCallback callback;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          'Error inesperado',
          textAlign: TextAlign.center,
        ),
        TextButton(
          child: Text(
            'Intentar de nuevo',
            textAlign: TextAlign.center,
          ),
          onPressed: this.callback,
        ),
      ],
    );
  }
}
