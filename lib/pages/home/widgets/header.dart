import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:tekus/repository/implementatios.dart';
import 'package:tekus/repository/repository.dart';
import 'package:tekus/utils/format_text.dart';

class HeaderHome extends StatefulWidget {
  const HeaderHome({Key? key, required this.priceBTC}) : super(key: key);

  final String? priceBTC;

  @override
  _HeaderHomeState createState() => _HeaderHomeState();
}

class _HeaderHomeState extends State<HeaderHome> {
  final ApiCoinbaseRepository _repository = ApiCoinbaseImpl(DataApiCoinbase());

  ValueNotifier<String> priceBTC = ValueNotifier('');
  Timer? priceTimerSeconds;
  final Random random = new Random();

  @override
  void initState() {
    priceBTC.value = widget.priceBTC!;
    priceTimerSeconds = Timer.periodic(
      const Duration(seconds: 60),
      (_) async {
        priceBTC.value = await _repository.getBTCCurrent();
        setState(() {});
      },
    );
    super.initState();
  }

  @override
  void dispose() {
    priceTimerSeconds?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 250,
      child: Stack(
        fit: StackFit.expand,
        children: [
          FittedBox(
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
                    backgroundColor: Colors.grey,
                    strokeWidth: 2,
                  );
                },
              ),
            ),
          ),
          Container(
            decoration: BoxDecoration(shape: BoxShape.circle),
            child: ValueListenableBuilder<String>(
              valueListenable: priceBTC,
              builder: (_, value, __) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('1 BITCOIN'),
                    Text(
                      '\$' + format(value),
                      style: Theme.of(context)
                          .textTheme
                          .headline5!
                          .copyWith(fontWeight: FontWeight.bold),
                    ),
                    Text('Dólares'),
                    const SizedBox(height: 5),
                    Text(
                      '\$' + value,
                      style: Theme.of(context)
                          .textTheme
                          .caption!
                          .copyWith(color: Colors.white70),
                    ),
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
