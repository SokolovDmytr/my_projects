import 'package:redux_epics/redux_epics.dart';
import 'package:rxdart/rxdart.dart';
import 'package:yellow_team_fridge/models/pages/ingredient.dart';
import 'package:yellow_team_fridge/models/pages/token.dart';
import 'package:yellow_team_fridge/services/network_service/models/base_http_response.dart';
import 'package:yellow_team_fridge/services/network_service/network_service.dart';
import 'package:yellow_team_fridge/services/network_service/res/consts.dart';
import 'package:yellow_team_fridge/services/network_service/res/request_params/login_params.dart';
import 'package:yellow_team_fridge/services/network_service/res/request_params/logout_params.dart';
import 'package:yellow_team_fridge/services/network_service/res/request_params/registration_params.dart';
import 'package:yellow_team_fridge/services/network_service/shared/fridge_parser.dart';
import 'package:yellow_team_fridge/store/application/app_state.dart';
import 'package:yellow_team_fridge/store/token_state/actions/delete_token_action.dart';
import 'package:yellow_team_fridge/store/token_state/actions/log_in_action.dart';
import 'package:yellow_team_fridge/store/token_state/actions/log_out_action.dart';
import 'package:yellow_team_fridge/store/token_state/actions/register_action.dart';
import 'package:yellow_team_fridge/store/token_state/actions/save_token_action.dart';

class TokenEpics {
  static final indexEpic = combineEpics<AppState>([
    registerToken,
    logIn,
    logOut,
  ]);

  static Stream<dynamic> registerToken(
    Stream<dynamic> actions,
    EpicStore<AppState> store,
  ) {
    return actions.whereType<RegisterAction>().switchMap(
      (action) async* {
        NetworkService.instance.init(baseUrl: baseUrl);
        final BaseHttpResponse response = await NetworkService.instance.requestWithParams(
          type: HttpType.httpGet,
          route: HttpRoute.login,
          parameter: RegistrationParams(
            email: action.email,
            firstName: action.firstName,
            password: action.password,
          ),
        );
        if (response.error == null) {
          final Token token = FridgeParser.instance.parseEntity(
            exampleObject: Token,
            response: response,
          );
          yield SaveTokenAction(
            token: token,
          );
        }
      },
    );
  }

  static Stream<dynamic> logIn(
    Stream<dynamic> actions,
    EpicStore<AppState> store,
  ) {
    return actions.whereType<LogInAction>().switchMap(
      (action) async* {
        NetworkService.instance.init(baseUrl: baseUrl);
        final BaseHttpResponse response = await NetworkService.instance.requestWithParams(
          type: HttpType.httpGet,
          route: HttpRoute.login,
          parameter: LoginParams(
            email: action.email,
            password: action.password,
          ),
        );
        if (response.error == null) {
          final Token token = FridgeParser.instance.parseEntity(
            exampleObject: Token,
            response: response,
          );
          yield SaveTokenAction(
            token: token,
          );
        }
      },
    );
  }

  static Stream<dynamic> logOut(
    Stream<dynamic> actions,
    EpicStore<AppState> store,
  ) {
    return actions.whereType<LogOutAction>().switchMap(
      (action) async* {
        NetworkService.instance.init(baseUrl: baseUrl);
        final BaseHttpResponse response = await NetworkService.instance.requestWithParams(
          type: HttpType.httpGet,
          route: HttpRoute.login,
          parameter: LogOutParams(
            token: action.token.token,
          ),
        );
        if (response.error == null) {
          yield DeleteTokenAction();
        }
      },
    );
  }
}
