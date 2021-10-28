import 'package:fridge_yellow_team_bloc/res/const.dart';
import 'package:fridge_yellow_team_bloc/services/network_service/interfaces/i_parameter.dart';
import 'package:fridge_yellow_team_bloc/services/network_service/res/consts.dart';

class GetRecipeParams implements IParameter {
  final String token;
  final String locale;
  final List<String> idList;

  const GetRecipeParams({
    required this.token,
    required this.locale,
    required this.idList,
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

    return {
      parameterKeys['token']!: token,
      parameterKeys['locale']!: locale,
      parameterKeys['ids']!: ids,
    };
  }
}
