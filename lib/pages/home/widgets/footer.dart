import 'package:flutter/material.dart';
import 'package:tekus/repository/implementatios.dart';
import 'package:tekus/repository/repository.dart';
import 'package:tekus/routes/routes.dart';
import 'package:tekus/utils/format_text.dart';

///Retorna el Footer/pie del screen [HomePage]
class FooterHome extends StatelessWidget {
  FooterHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
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
              return _FooterItem(index: index);
            },
          ),
        ),
      ],
    );
  }
}

///Retorna un [ListTile] personalizado como modelo para el historico de cierre
class _FooterItem extends StatelessWidget {
  final ApiCoinbaseRepository _repository = ApiCoinbaseImpl(DataApiCoinbase());
  final int index;

  _FooterItem({
    Key? key,
    required this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final date = DateTime.now().subtract(
      Duration(days: index + 1),
    );
    return Container(
      margin: const EdgeInsets.only(bottom: .5),
      child: ListTile(
        onTap: () =>
            Navigator.pushNamed(context, AppRoutes.DETAILS, arguments: date),
        trailing: Icon(Icons.arrow_forward_ios, size: 14),
        tileColor: Colors.black12,
        title: Text('${date.weekday.nameDayWeek} ${date.day}'),
        subtitle: FutureBuilder<String>(
          future: _repository.getDayHistory(
              '${date.year}', '${date.month}', '${date.day}', 'USD'),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Container(
                height: 10,
                decoration: BoxDecoration(
                  color: Colors.white10,
                  borderRadius: BorderRadius.circular(12),
                ),
              );
            }

            return Text(
              'USD: \$' + snapshot.data!.format,
            );
          },
        ),
      ),
    );
  }
}
