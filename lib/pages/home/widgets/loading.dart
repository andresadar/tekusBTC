import 'package:flutter/material.dart';

///Retornar un Shimmer para indicar al usuario que se esta estableciendo la conexión
class LoadingWidget extends StatelessWidget {
  const LoadingWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //TODO: QUITAR LANDSCOPE

    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        children: [
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: Colors.white10),
            ),
          ),
          const SizedBox(height: 10),
          Expanded(
            child: Column(
              children: List.generate(
                3,
                (index) => Expanded(
                  child: Container(
                    margin: const EdgeInsets.symmetric(vertical: 5),
                    decoration: BoxDecoration(
                      color: Colors.white10,
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
