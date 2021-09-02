import 'package:tekus/repository/repository.dart';

abstract class ApiCoinbaseRepository {
  Future<String> getBTCCurrent();
  Future<String> getDayHistory(
      String year, String month, String day, String currency);
}

class ApiCoinbaseImpl implements ApiCoinbaseRepository {
  final DataApiCoinbase _apiCoinbase;
  ApiCoinbaseImpl(this._apiCoinbase);

  ///Retorna un [String] con el precio actual del Bitcoin en COP,
  ///en caso de un error retorna un [String] con el [statusCode] del error
  @override
  Future<String> getBTCCurrent() {
    return _apiCoinbase.getBTCCurrent();
  }

  ///Retorna un [String] con el precio del [day][month][year] del Bitcoin en moneda segun el [currency],
  ///en caso de un error retorna un [String] con el [statusCode] del error
  @override
  Future<String> getDayHistory(
      String year, String month, String day, String currency) {
    return _apiCoinbase.getDayHistory(year, month, day, currency);
  }
}
