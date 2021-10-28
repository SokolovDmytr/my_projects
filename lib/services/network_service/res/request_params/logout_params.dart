import 'package:fridge_yellow_team_bloc/services/network_service/interfaces/i_parameter.dart';
import 'package:fridge_yellow_team_bloc/services/network_service/res/consts.dart';

class LogOutParams implements IParameter {
  final String token;

  const LogOutParams({
    required this.token,
  });

  @override
  Map<String, String> getParams() {
    return {
      parameterKeys['token']!: token,
    };
  }
}
