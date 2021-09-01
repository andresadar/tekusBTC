import 'package:tekus/repository/repository.dart';

abstract class ApiCoinbaseRepository {
  Future<String> getBTCCurrent();
}

class ApiCoinbaseImpl implements ApiCoinbaseRepository {
  final DataApiCoinbase _apiCoinbase;

  ApiCoinbaseImpl(this._apiCoinbase);

  @override
  Future<String> getBTCCurrent() {
    return _apiCoinbase.getBTCCurrent();
  }
}
