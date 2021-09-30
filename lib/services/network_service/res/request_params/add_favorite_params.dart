import 'package:flutter/material.dart';
import 'package:yellow_team_fridge/services/network_service/interfaces/i_parameter.dart';
import 'package:yellow_team_fridge/services/network_service/res/consts.dart';

class AddFavoriteParams implements IParameter {
  final String token;
  final String recipeId;

  AddFavoriteParams({
    @required this.token,
    @required this.recipeId,
  });

  @override
  Map<String, String> getParams() {
    return {
      parameterKeys['token']: token,
      parameterKeys['recipeId']: recipeId,
    };
  }
}
