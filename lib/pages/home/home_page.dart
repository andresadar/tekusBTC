import 'package:flutter/material.dart';
import 'package:tekus/repository/implementatios.dart';
import 'package:tekus/repository/repository.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  ValueNotifier<String> priceBTC = ValueNotifier<String>('200');

  @override
  Widget build(BuildContext context) {
    final ApiCoinbaseRepository _repository =
        ApiCoinbaseImpl(DataApiCoinbase());

    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: InkWell(
              onTap: () async {
                await _repository.getBTCCurrent();
              },
              child: Center(
                child: ValueListenableBuilder<String>(
                  valueListenable: priceBTC,
                  builder: (_, value, ___) {
                    return Text(value);
                  },
                ),
              ),
            ),
          ),
          Expanded(
            child: ListView(
              children: [],
            ),
          ),
        ],
      ),
    );
  }
}
