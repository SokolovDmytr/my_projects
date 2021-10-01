import 'package:flutter/foundation.dart';
import 'package:redux/redux.dart';
import 'package:yellow_team_fridge/store/application/app_state.dart';
import 'package:yellow_team_fridge/store/token_state/token_selectors.dart';

class AuthPageViewModel {
  final void Function(
    String email,
    String firstName,
    String password,
  ) registerUser;
  final void Function(
    String email,
    String password,
  ) logIn;

  AuthPageViewModel({
    @required this.registerUser,
    @required this.logIn,
  });

  static AuthPageViewModel init(Store<AppState> store) {
    return AuthPageViewModel(
      registerUser: TokenSelectors.registerUser(store),
      logIn: TokenSelectors.logIn(store),
    );
  }
}
