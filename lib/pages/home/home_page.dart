import 'package:flutter/material.dart';

import 'package:tekus/pages/home/widgets/header.dart';
import 'package:tekus/repository/implementatios.dart';
import 'package:tekus/repository/repository.dart';
import 'package:tekus/utils/days_week.dart';
import 'package:tekus/utils/format_text.dart';

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
          centerTitle: true,
          actions: [
            TextButton(
              onPressed: () async {
                await _repository.getDayHistory('2021', '08', '21', 'USD');
              },
              child: Text('Text'),
            )
          ],
        ),
        body: FutureBuilder<String>(
          future: _repository.getBTCCurrent(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return _LoadingWidget();
            }

            if (snapshot.hasError) {
              return _ErrorWidget(
                callback: () {
                  setState(() {});
                },
              );
            }

            return SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 20),
                  HeaderHome(priceBTC: snapshot.data),
                  // const SizedBox(height: 10),
                  Container(
                    padding: const EdgeInsets.all(10),
                    child: Text(
                      'Histórico:',
                      style: Theme.of(context)
                          .textTheme
                          .headline6!
                          .copyWith(fontWeight: FontWeight.bold),
                    ),
                  ),
                  Column(
                    children: List.generate(
                      15,
                      (index) {
                        final date = DateTime.now().subtract(
                          Duration(days: index + 1),
                        );

                        String dayName = DaysWeek.daysWeek[date.weekday]!;
                        String month = date.month.toString();
                        String day = date.day.toString();

                        return Container(
                          margin: const EdgeInsets.only(bottom: .5),
                          child: ListTile(
                            onTap: () {},
                            trailing: Icon(Icons.arrow_forward_ios, size: 14),
                            tileColor: Colors.black12,
                            title: Text(dayName + day),
                            subtitle: FutureBuilder<String>(
                              future: _repository.getDayHistory(
                                  '${date.year}', month, day, 'USD'),
                              builder: (context, snapshot) {
                                if (snapshot.connectionState ==
                                    ConnectionState.waiting) {
                                  return Container(
                                    height: 10,
                                    decoration: BoxDecoration(
                                        color: Colors.white10,
                                        borderRadius:
                                            BorderRadius.circular(12)),
                                  );
                                }

                                return Text('USD: ' + format(snapshot.data!));
                              },
                            ),
                          ),
                        );
                      },
                    ),
                  )
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}

class _LoadingWidget extends StatelessWidget {
  const _LoadingWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(child: CircularProgressIndicator());
  }
}

class _ErrorWidget extends StatelessWidget {
  const _ErrorWidget({Key? key, required this.callback}) : super(key: key);

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
