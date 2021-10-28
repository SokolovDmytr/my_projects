import 'package:flutter/material.dart';
import 'package:fridge_yellow_team_bloc/services/network_service/interfaces/i_parameter.dart';
import 'package:fridge_yellow_team_bloc/services/network_service/res/consts.dart';

class RecoverParams implements IParameter {
  final String email;

  const RecoverParams({
    required this.email,
  });

  @override
  Map<String, String> getParams() {
    return {
      parameterKeys['email']!: email,
    };
  }
}
