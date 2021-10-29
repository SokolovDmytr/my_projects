import 'package:fridge_yellow_team_bloc/models/pages/freezed/token.dart';
import 'package:fridge_yellow_team_bloc/services/user_information_service/user_information_service.dart';

class ApplicationTokenState {
  final Token? token;

  ApplicationTokenState({
    required this.token,
  });

  static ApplicationTokenState init() {
    final Token? token = UserInformationService.instance.init();
    return ApplicationTokenState(token: token);
  }

  ApplicationTokenState copyWith({
    Token? token,
  }) {
    return ApplicationTokenState(token: token ?? this.token);
  }
}
