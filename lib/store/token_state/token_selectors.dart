import 'package:redux/redux.dart';
import 'package:yellow_team_fridge/models/pages/token.dart';
import 'package:yellow_team_fridge/store/application/app_state.dart';
import 'package:yellow_team_fridge/store/token_state/actions/log_in_action.dart';
import 'package:yellow_team_fridge/store/token_state/actions/log_out_action.dart';
import 'package:yellow_team_fridge/store/token_state/actions/register_action.dart';

class TokenSelectors {
  static Token getToken(Store<AppState> store) {
    return store.state.tokenState.token;
  }

  static void Function(
    String email,
    String firstName,
    String password,
  ) registerUser(Store<AppState> store) {
    return (
      String email,
      String firstName,
      String password,
    ) =>
        store.dispatch(
          RegisterAction(
            password: password,
            firstName: firstName,
            email: email,
          ),
        );
  }

  static void Function(
    String email,
    String password,
  ) logIn(Store<AppState> store) {
    return (
      String email,
      String password,
    ) =>
        store.dispatch(
          LogInAction(
            email: email,
            password: password,
          ),
        );
  }

  static void Function() logOut(Store<AppState> store) {
    return () => store.dispatch(LogOutAction(token: store.state.tokenState.token));
  }
}
