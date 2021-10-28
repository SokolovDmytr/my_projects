import 'package:flutter/material.dart';
import 'package:fridge_yellow_team_bloc/services/network_service/interfaces/i_parameter.dart';
import 'package:fridge_yellow_team_bloc/services/network_service/res/consts.dart';

class LoginGoogleParams implements IParameter {
  final String email;
  final String googleToken;

  const LoginGoogleParams({
    required this.email,
    required this.googleToken,
  });

  @override
  Map<String, String> getParams() {
    return {
      parameterKeys['email']!: email,
      parameterKeys['googleToken']!: googleToken,
    };
  }
}
