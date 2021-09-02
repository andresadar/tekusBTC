import 'package:flutter/material.dart';

import 'package:tekus/pages/home/widgets/footer.dart';
import 'package:tekus/pages/home/widgets/header.dart';
import 'package:tekus/repository/implementatios.dart';
import 'package:tekus/repository/repository.dart';

import 'widgets/loading.dart';

///Screen de la ruta inicial
class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final ApiCoinbaseRepository _repository = ApiCoinbaseImpl(DataApiCoinbase());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('TekusBTC'),
        ),
        body: FutureBuilder<String>(
          future: _repository.getBTCCurrent(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return LoadingWidget();
            }

            if (snapshot.hasError) {
              return ErrorWidget(() {
                setState(() {});
              });
            }

            return SingleChildScrollView(
              padding: const EdgeInsets.only(top: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  HeaderHome(priceBTC: snapshot.data),
                  FooterHome(),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
