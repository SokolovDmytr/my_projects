import 'package:fridge_yellow_team_bloc/services/network_service/interfaces/i_parameter.dart';
import 'package:fridge_yellow_team_bloc/services/network_service/res/consts.dart';

class RefreshTokenParams implements IParameter {
  final String refreshToken;

  const RefreshTokenParams({
    required this.refreshToken,
  });

  @override
  Map<String, String> getParams() {
    return {
      parameterKeys['refreshToken']!: refreshToken,
    };
  }
}
