import 'package:flutter/material.dart';
import 'package:yellow_team_fridge/models/pages/token.dart';
import 'package:yellow_team_fridge/store/shared/base_action.dart';

class LogOutAction extends BaseAction {
  final Token token;

  const LogOutAction({
    @required this.token,
  });
}
