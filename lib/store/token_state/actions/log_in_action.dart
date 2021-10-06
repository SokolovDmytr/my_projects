import 'package:flutter/material.dart';
import 'package:yellow_team_fridge/store/shared/base_action.dart';

class LogInAction extends BaseAction {
  final String email;
  final String password;

  const LogInAction({
    @required this.email,
    @required this.password,
  });
}
