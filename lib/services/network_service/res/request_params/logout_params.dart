import 'package:flutter/material.dart';
import 'package:yellow_team_fridge/services/network_service/interfaces/i_parameter.dart';
import 'package:yellow_team_fridge/services/network_service/res/consts.dart';

class LogOutParams implements IParameter {
  final String token;

  LogOutParams({
    @required this.token,
  });

  @override
  Map<String, String> getParams() {
    return {
      parameterKeys['token']: token,
    };
  }
}
