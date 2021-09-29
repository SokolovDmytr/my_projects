import 'package:flutter/material.dart';
import 'package:yellow_team_fridge/services/network_service/interfaces/i_parameter.dart';
import 'package:yellow_team_fridge/services/network_service/res/consts.dart';

class RefreshTokenParams implements IParameter {
  final String refreshToken;

  RefreshTokenParams({
    @required this.refreshToken,
  });

  @override
  Map<String, String> getParams() {
    return {
      parameterKeys['refreshToken']: refreshToken,
    };
  }
}
