import 'package:tekus/repository/repository.dart';

abstract class ApiCoinbaseRepository {
  Future<String> getBTCCurrent();
  Future<String> getDayHistory(
      String year, String month, String day, String currency);
}

class ApiCoinbaseImpl implements ApiCoinbaseRepository {
  final DataApiCoinbase _apiCoinbase;

  ApiCoinbaseImpl(this._apiCoinbase);

  @override
  Future<String> getBTCCurrent() {
    return _apiCoinbase.getBTCCurrent();
  }

  @override
  Future<String> getDayHistory(
      String year, String month, String day, String currency) {
    return _apiCoinbase.getDayHistory(year, month, day, currency);
  }
}
