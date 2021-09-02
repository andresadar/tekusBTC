import 'dart:convert';
import 'package:http/http.dart' as http;

class DataApiCoinbase {
  ///Retorna un [String] con el precio actual del Bitcoin en COP,
  ///en caso de un error retorna un [String] con el [statusCode] del error
  Future<String> getBTCCurrent() async {
    String priceBTC = '', _authority = 'api.coinbase.com';

    final _url =
        Uri.https(_authority, '/v2/exchange-rates', {'currency': 'BTC'});

    final _response = await http.get(_url);

    if (_response.statusCode != 200)
      return priceBTC = 'Error code' + _response.statusCode.toString();

    final _decodedData = json.decode(_response.body);

    priceBTC = _decodedData['data']['rates']['USD'];

    return priceBTC;
  }

  ///Retorna un [String] con el precio del [day][month][year] del Bitcoin en moneda segun el [currency],
  ///en caso de un error retorna un [String] con el [statusCode] del error
  Future<String> getDayHistory(
      String year, String month, String day, String currency) async {
    String price = '';

    final String _authority = 'api.coinbase.com';

    final _url = Uri.https(_authority, '/v2/prices/BTC-$currency/spot',
        {'date': '$year-$month-$day'});

    final _response = await http.get(_url);

    if (_response.statusCode != 200)
      return price = 'Error code' + _response.statusCode.toString();

    final _decodedData = json.decode(_response.body);

    price = _decodedData['data']['amount'];

    return price;
  }
}
