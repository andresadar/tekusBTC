String format(String text) {
  List<String> list = text.split('');

  int index = list.indexOf('.');

  list.removeRange(index, list.length);

  String newText = list.join('');

  print(newText);

  if (newText.length > 2) {
    var value = newText;
    value = value.replaceAll(RegExp(r'\D'), '');
    value = value.replaceAll(RegExp(r'\B(?=(\d{3})+(?!\d))'), ',');
    return value;
  }

  return text;
}
