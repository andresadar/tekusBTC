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
      return priceBTC = 'Erro code' + _response.statusCode.toString();

    final _decodedData = json.decode(_response.body);

    priceBTC = _decodedData['data']['rates']['COP'];

    print(priceBTC);

    return priceBTC;
  }
}
