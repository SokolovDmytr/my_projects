import 'package:flutter_redux/flutter_redux.dart';
import 'package:yellow_team_fridge/res/app_duration.dart';
import 'package:yellow_team_fridge/res/const.dart';
import 'package:yellow_team_fridge/services/network_service/network_service.dart';
import 'package:yellow_team_fridge/models/pages/token.dart';
import 'package:yellow_team_fridge/services/network_service/models/base_http_response.dart';
import 'package:yellow_team_fridge/services/network_service/res/consts.dart';
import 'package:yellow_team_fridge/services/network_service/res/request_params/login_params.dart';
import 'package:yellow_team_fridge/services/network_service/shared/fridge_parser.dart';
import 'package:yellow_team_fridge/services/route_service/route_service.dart';
import 'package:yellow_team_fridge/services/user_information_service/user.dart';
import 'package:yellow_team_fridge/store/application/app_state.dart';
import 'package:yellow_team_fridge/store/token_state/actions/save_token_action.dart';

import 'package:hive/hive.dart';

class UserInformationService {
  static const tag = '[UserInformationService]';

  static final UserInformationService _instance = UserInformationService._();

  static UserInformationService get instance => _instance;

  UserInformationService._();
  User _user;

  Future<Token> init() async {
    logger.d('Load information');
    Box<User> box = await Hive.box<User>(hiveBoxName);
    _user = await box.get(userKey);

    if (_user?.token == null) {
      _user = User(
        isFirstSeeSwipeTutorial: false,
        isFirstVisitApp: false,
      );
    }

    if (_user.token == null) {
      return null;
    } else {
      return Token(
        token: _user.token,
        refreshToken: _user.refreshToken,
        createDate: _user.createDate,
        ttlToken: _user.ttlToken,
      );
    }
  }

  Future<String> getToken() async {
    final Token token = StoreProvider.of<AppState>(RouteService.instance.navigatorKey.currentContext).state.tokenState.token;

    if (token != null &&
        token.createDate != null &&
        token.createDate.add(AppDuration.timeValidOfToken).isAfter(
              DateTime.now(),
            )) {
      logger.d('Use old token');

      return token.token;
    } else {
      logger.d('Update token');

      NetworkService.instance.init(baseUrl: baseUrl);
      final BaseHttpResponse response = await NetworkService.instance.requestWithParams(
        type: HttpType.httpGet,
        route: HttpRoute.login,
        parameter: LoginParams(
          email: 'maximshirokostup@capdefier.com',
          password: '12345',
        ),
      );
      if (response.error == null) {
        final Token token = FridgeParser.instance.parseEntity(
          exampleObject: Token,
          response: response,
        );

        StoreProvider.of<AppState>(RouteService.instance.navigatorKey.currentContext).dispatch(
          SaveTokenAction(
            token: token,
          ),
        );

        return token.token;
      }
    }

    return null;
  }

  void saveInformation() async {
    logger.d('Save information');

    final Token token = StoreProvider.of<AppState>(RouteService.instance.navigatorKey.currentContext).state.tokenState.token;

    User user;
    if (token != null) {
      user = User(
        token: token.token,
        refreshToken: token.refreshToken,
        createDate: token.createDate,
        ttlToken: token.ttlToken,
        isFirstSeeSwipeTutorial: _user.isFirstSeeSwipeTutorial,
        isFirstVisitApp: _user.isFirstVisitApp,
      );
    }else{
      user = User(
        isFirstSeeSwipeTutorial: _user.isFirstSeeSwipeTutorial,
        isFirstVisitApp: _user.isFirstVisitApp,
      );
    }

    Box<User> box = await Hive.box<User>(hiveBoxName);
    await box.put(userKey, user);
  }

  void visitApp() => _user.isFirstVisitApp = true;

  void seeSwipeTutorial() => _user.isFirstSeeSwipeTutorial = true;

  bool isFirstVisitApp() => _user.isFirstVisitApp;

  bool isFirstSeeSwipeTutorial() => _user.isFirstSeeSwipeTutorial;
}
