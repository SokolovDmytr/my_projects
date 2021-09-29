import 'package:flutter/material.dart';
import 'package:yellow_team_fridge/services/network_service/interfaces/i_parameter.dart';
import 'package:yellow_team_fridge/services/network_service/res/consts.dart';

class LoginGoogleParams implements IParameter {
  final String email;
  final String googleToken;

  LoginGoogleParams({
    @required this.email,
    @required this.googleToken,
  });

  @override
  Map<String, String> getParams() {
    return {
      parameterKeys['email']: email,
      parameterKeys['googleToken']: googleToken,
    };
  }
}
