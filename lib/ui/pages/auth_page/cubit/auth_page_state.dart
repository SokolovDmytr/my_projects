import 'package:fridge_yellow_team_bloc/models/pages/freezed/token.dart';
import 'package:fridge_yellow_team_bloc/res/const.dart';

class AuthPageState {
  final Token? token;

  AuthPageState({
    this.token,
  });

  static AuthPageState init() {
    return AuthPageState(
      token: Token(
        token: emptyString,
        ttlToken: emptyString,
        refreshToken: emptyString,
        createDate: DateTime.now(),
      ),
    );
  }

  AuthPageState copyWith({
    Token? token,
  }) {
    return AuthPageState(token: token ?? this.token);
  }
}
