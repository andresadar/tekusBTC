import 'package:flutter_test/flutter_test.dart';
import '../lib/utils/format_text.dart';

void main() {
  test('format currency test >', () {
    final currency = '123456789';
    expect(currency.format, '123,456,789');
  });

  test('format date month test >', () {
    final date = 1;
    expect(date.nameDayWeek, 'Lunes');
    final date2 = 8;
    expect(date2.nameDayWeek, '8');
    final date3 = 0;
    expect(date3.nameDayWeek, '0');
    final date4 = 7;
    expect(date4.nameDayWeek, 'Domingo');
  });

  test('format date day test >', () {
    final date = 1;
    expect(date.nameMonth, 'Enero');
    final date2 = 13;
    expect(date2.nameMonth, '13');
    final date3 = 0;
    expect(date3.nameMonth, '0');
    final date4 = 12;
    expect(date4.nameMonth, 'Diciembre');
  });
}
