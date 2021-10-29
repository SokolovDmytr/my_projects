import 'package:fridge_yellow_team_bloc/models/pages/freezed/token.dart';
import 'package:fridge_yellow_team_bloc/res/const.dart';

class ApplicationTokenState {
  final Token token;

  ApplicationTokenState({
    required this.token,
  });

  static ApplicationTokenState init() {
    return ApplicationTokenState(
      token: Token(
        token: emptyString,
        ttlToken: emptyString,
        refreshToken: emptyString,
        createDate: DateTime.now(),
      ),
    );
  }

  ApplicationTokenState copyWith({
    Token? token,
  }) {
    return ApplicationTokenState(token: token ?? this.token);
  }
}
