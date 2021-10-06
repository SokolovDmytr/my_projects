import 'package:flutter/cupertino.dart';
import 'package:yellow_team_fridge/models/pages/token.dart';
import 'package:yellow_team_fridge/res/const.dart';

class TokenParser {
  Token parse({
    @required dynamic token,
  }) {
    Token currentToken;
    try {
      currentToken = Token(
        /*
        subtract needed to count the time to request to the server
         */
        createDate: DateTime.now().subtract(milliseconds500),
        refreshToken: token['refreshToken'],
        token: token['token'],
        ttlToken: token['ttlToken'],
      );
    } catch (error) {
      logger.d('Token parser error: ${error}');
    }
    return currentToken;
  }
}
