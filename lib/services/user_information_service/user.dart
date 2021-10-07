import 'dart:io';

import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

part 'user_adapter.g.dart';

@HiveType(typeId: 1)
class User {
  @HiveField(0)
  final String token;
  @HiveField(1)
  final String refreshToken;
  @HiveField(2)
  final String ttlToken;
  @HiveField(3)
  final DateTime createDate;
  @HiveField(4)
  bool isFirstVisitApp;
  @HiveField(5)
  bool isFirstSeeSwipeTutorial;

  User({
    @required this.isFirstVisitApp,
    @required this.isFirstSeeSwipeTutorial,
    this.token,
    this.refreshToken,
    this.ttlToken,
    this.createDate,
  });
}
