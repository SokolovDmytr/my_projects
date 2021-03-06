import 'package:fridge_yellow_team_bloc/services/network_service/interfaces/i_parameter.dart';
import 'package:fridge_yellow_team_bloc/services/network_service/res/consts.dart';

class GetFavoritesParams implements IParameter {
  final String token;
  final String locale;

  const GetFavoritesParams({
    required this.token,
    required this.locale,
  });

  @override
  Map<String, String> getParams() {
    return {
      parameterKeys['token']!: token,
      parameterKeys['locale']!: locale,
    };
  }
}
