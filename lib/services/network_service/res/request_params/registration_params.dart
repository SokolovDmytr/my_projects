import 'package:fridge_yellow_team_bloc/services/network_service/interfaces/i_parameter.dart';
import 'package:fridge_yellow_team_bloc/services/network_service/res/consts.dart';

class RegistrationParams implements IParameter {
  final String firstName;
  final String email;
  final String password;

  const RegistrationParams({
    required this.firstName,
    required this.email,
    required this.password,
  });

  @override
  Map<String, String> getParams() {
    return {
      parameterKeys['firstName']!: firstName,
      parameterKeys['email']!: email,
      parameterKeys['password']!: password,
    };
  }
}
