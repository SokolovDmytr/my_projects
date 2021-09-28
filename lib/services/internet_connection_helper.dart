import 'package:data_connection_checker/data_connection_checker.dart';

class InternetConnectionHelper{
  static Future<bool> hasInternetConnection() async {
    return await DataConnectionChecker().hasConnection;
  }
}
