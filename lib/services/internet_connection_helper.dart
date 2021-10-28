import 'dart:io';

import 'package:fridge_yellow_team_bloc/services/network_service/res/consts.dart';

class InternetConnectionHelper {
  static Future<bool> hasInternetConnection() async {
    try {
      final List<InternetAddress> result = await InternetAddress.lookup(exampleUrl);
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        return true;
      }
    } on SocketException catch (_) {
      return false;
    }
    return false;
  }
}
