import 'package:flutter/material.dart';
import 'package:yellow_team_fridge/res/const.dart';
import 'package:yellow_team_fridge/services/network_service/interfaces/i_parameter.dart';
import 'package:yellow_team_fridge/services/network_service/res/consts.dart';

class GetRecipeParams implements IParameter {
  final String token;
  final String locale;
  final List<String> idList;

  GetRecipeParams({
    @required this.token,
    @required this.locale,
    @required this.idList,
  });

  @override
  Map<String, String> getParams() {
    String ids = emptyString;
    for (int i = 0; i < idList.length; i++) {
      ids += idList[i];

      if (i != idList.length - 1) {
        ids += coma;
      }
    }

    logger.d(ids);

    return {
      parameterKeys['token']: token,
      parameterKeys['locale']: locale,
      parameterKeys['ids']: ids,
    };
  }
}
