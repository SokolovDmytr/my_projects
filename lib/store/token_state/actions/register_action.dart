import 'package:flutter/material.dart';
import 'package:yellow_team_fridge/store/shared/base_action.dart';

class RegisterAction extends BaseAction {
  final String email;
  final String firstName;
  final String password;

  const RegisterAction({
    @required this.email,
    @required this.password,
    @required this.firstName,
  });
}
