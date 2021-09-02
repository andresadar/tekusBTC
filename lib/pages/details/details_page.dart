import 'package:flutter/material.dart';
import 'package:tekus/repository/implementatios.dart';
import 'package:tekus/repository/repository.dart';
import 'package:tekus/utils/format_text.dart';

///El screen que muestra el detalle del historico de cierre en el BTC
class DetailsPage extends StatelessWidget {
  const DetailsPage({Key? key, required this.date}) : super(key: key);

  final DateTime date;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: ListView(
            shrinkWrap: true,
            children: [
              Text(
                'BTC',
                textAlign: TextAlign.center,
              ),
              Text(
                '${date.day} de ${date.month.nameMonth} del ${date.year}',
                textAlign: TextAlign.center,
                style: Theme.of(context)
                    .textTheme
                    .headline6!
                    .copyWith(fontWeight: FontWeight.bold),
              ),
              Text(
                'Precio de cierre',
                textAlign: TextAlign.center,
              ),
              _CurrencyItem(
                date: date,
                currency: 'COP',
                note: 'Pesos Colombianos',
              ),
              _CurrencyItem(
                date: date,
                currency: 'USD',
                note: 'Dólares Estadounidenses',
              ),
              _CurrencyItem(
                date: date,
                currency: 'EUR',
                note: 'Euros',
              ),
            ],
          ),
        ),
      ),
    );
  }
}

///Retorna un [ListTile] personalizado para mostrar el precio en [currency] partiendo
///de un [date] determinado
class _CurrencyItem extends StatelessWidget {
  final ApiCoinbaseRepository _repository = ApiCoinbaseImpl(DataApiCoinbase());

  _CurrencyItem({
    Key? key,
    required this.date,
    required this.currency,
    required this.note,
  }) : super(key: key);

  final DateTime date;
  final String currency, note;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      alignment: Alignment.center,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.deepPurple),
      ),
      child: ListTile(
        title: FutureBuilder<String>(
          future: _repository.getDayHistory(
              '${date.year}', '${date.month}', '${date.day}', currency),
          builder: (_, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Container(
                height: 10,
                decoration: BoxDecoration(
                  color: Colors.white10,
                  borderRadius: BorderRadius.circular(12),
                ),
              );
            }
            return Text(snapshot.data!.format);
          },
        ),
        subtitle: Text(note),
        trailing: Text(currency),
      ),
    );
  }
}
