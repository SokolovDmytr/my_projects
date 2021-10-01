import 'package:flutter/material.dart';

class Token {
  final String token;
  final String refreshToken;
  final String ttlToken;
  final DateTime createDate;

  const Token({
    @required this.token,
    @required this.createDate,
    @required this.refreshToken,
    @required this.ttlToken,
  });
}
