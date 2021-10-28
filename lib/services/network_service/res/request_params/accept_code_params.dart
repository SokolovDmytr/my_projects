import 'package:fridge_yellow_team_bloc/services/network_service/interfaces/i_parameter.dart';
import 'package:fridge_yellow_team_bloc/services/network_service/res/consts.dart';

class AcceptCodeParams implements IParameter {
  final String email;
  final String code;

  const AcceptCodeParams({
    required this.email,
    required this.code,
  });

  @override
  Map<String, String> getParams() {
    return {
      parameterKeys['email']!: email,
      parameterKeys['code']!: code,
    };
  }
}
