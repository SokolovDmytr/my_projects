import 'package:flutter/material.dart';
import 'package:fridge_yellow_team_bloc/services/network_service/interfaces/i_parameter.dart';
import 'package:fridge_yellow_team_bloc/services/network_service/res/consts.dart';

class LoginParams implements IParameter {
  final String email;
  final String password;

  const LoginParams({
    required this.email,
    required this.password,
  });

  @override
  Map<String, String> getParams() {
    return {
      parameterKeys['email']!: email,
      parameterKeys['password']!: password,
    };
  }
}
