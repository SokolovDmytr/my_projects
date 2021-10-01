import 'package:flutter/cupertino.dart';
import 'package:yellow_team_fridge/models/pages/token.dart';

class TokenParser {
  Token parse({
    @required dynamic token,
  }) {
    Token currentToken;
    try {
      currentToken = Token(
        createDate: DateTime.parse(token['createDate']),
        refreshToken: token['refreshToken'],
        token: token['token'],
        ttlToken: token['ttlToken'],
      );
    } catch (error) {
      print('Token parser error: ${error}');
    }
    return currentToken;
  }
}
