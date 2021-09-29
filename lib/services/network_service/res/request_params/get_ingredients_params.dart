import 'package:flutter/material.dart';
import 'package:yellow_team_fridge/services/network_service/interfaces/i_parameter.dart';
import 'package:yellow_team_fridge/services/network_service/res/consts.dart';

class GetIngredientsParams implements IParameter {
  final String token;
  final String locale;
  final String str;

  GetIngredientsParams({
    @required this.token,
    @required this.locale,
    @required this.str,
  });

  @override
  Map<String, String> getParams() {
    return {
      parameterKeys['token']: token,
      parameterKeys['locale']: locale,
      parameterKeys['str']: str,
    };
  }
}
