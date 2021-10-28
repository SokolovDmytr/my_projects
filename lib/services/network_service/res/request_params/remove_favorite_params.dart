import 'package:flutter/material.dart';
import 'package:fridge_yellow_team_bloc/services/network_service/interfaces/i_parameter.dart';
import 'package:fridge_yellow_team_bloc/services/network_service/res/consts.dart';

class RemoveFavoriteParams implements IParameter {
  final String token;
  final String recipeId;

  const RemoveFavoriteParams({
    required this.token,
    required this.recipeId,
  });

  @override
  Map<String, String> getParams() {
    return {
      parameterKeys['token']: token,
      parameterKeys['recipeId']: recipeId,
    };
  }
}
