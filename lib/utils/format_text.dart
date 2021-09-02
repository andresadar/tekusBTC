///Extensión de la clase [String] que devuelve un [String] en formato ###,###,###
///en caso de [lenght<2] devuelve el mismo string sin formato
extension CurrencyFormat on String {
  String get format {
    List<String> list = this.split('');

    if (this.length > 2 && list.contains('.')) {
      int index = list.indexOf('.');
      list.removeRange(index, list.length);
    }

    String newText = list.join('');

    if (newText.length > 2) {
      var value = newText;
      value = value.replaceAll(RegExp(r'\D'), '');
      value = value.replaceAll(RegExp(r'\B(?=(\d{3})+(?!\d))'), ',');
      return value;
    }

    return this;
  }
}

///Extensión de la clase [int] que devuelve un [String] con el nombre del día
///en caso de [<1 || >7] devuelve el [int] convertido en [String]
extension DateFormat on int {
  String get nameDayWeek {
    Map<int, String> daysWeek = {
      1: 'Lunes',
      2: 'Martes',
      3: 'Miercoles',
      4: 'Jueves',
      5: 'Viernes',
      6: 'Sábado',
      7: 'Domingo',
    };
    if (this >= 1 && this <= 7) {
      return daysWeek[this]!;
    }
    return this.toString();
  }

  ///Extensión de la clase [int] que devuelve un [String] con el nombre del mes
  ///en caso de [<1 || >12] devuelve el [int] convertido en [String]
  String get nameMonth {
    Map<int, String> months = {
      1: 'Enero',
      2: 'Febrero',
      3: 'Marzo',
      4: 'Abril',
      5: 'Mayo',
      6: 'Junio',
      7: 'Julio',
      8: 'Agosto',
      9: 'Septiembre',
      10: 'Octubre',
      11: 'Noviembre',
      12: 'Diciembre',
    };
    if (this >= 1 && this <= 12) {
      return months[this]!;
    }
    return this.toString();
  }
}
