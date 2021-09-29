import 'package:flutter/material.dart';
import 'package:yellow_team_fridge/services/network_service/interfaces/i_parameter.dart';
import 'package:yellow_team_fridge/services/network_service/res/consts.dart';

class RecoverParams implements IParameter {
  final String email;

  RecoverParams({
    @required this.email,
  });

  @override
  Map<String, String> getParams() {
    return {
      parameterKeys['email']: email,
    };
  }
}
