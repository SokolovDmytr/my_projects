import 'package:fridge_yellow_team_bloc/application/cubit/application_token_cubit.dart';
import 'package:fridge_yellow_team_bloc/models/pages/freezed/token.dart';
import 'package:fridge_yellow_team_bloc/res/app_duration.dart';
import 'package:fridge_yellow_team_bloc/res/const.dart';
import 'package:fridge_yellow_team_bloc/services/network_service/models/base_http_response.dart';
import 'package:fridge_yellow_team_bloc/services/network_service/network_service.dart';
import 'package:fridge_yellow_team_bloc/services/network_service/res/consts.dart';
import 'package:fridge_yellow_team_bloc/services/network_service/res/request_params/refresh_token_params.dart';
import 'package:fridge_yellow_team_bloc/services/network_service/shared/fridge_parser.dart';
import 'package:fridge_yellow_team_bloc/services/route_service/route_service.dart';
import 'package:fridge_yellow_team_bloc/services/user_information_service/user.dart';
import 'package:hive/hive.dart';
import 'package:provider/src/provider.dart';

class UserInformationService {
  static const tag = '[UserInformationService]';

  static final UserInformationService _instance = UserInformationService._();

  static UserInformationService get instance => _instance;

  UserInformationService._();

  User? _user;

  Token? init() {
    logger.d('Load information');
    final Box<User> box = Hive.box<User>(hiveBoxNameUser);
    _user = box.get(userKey);

    if (_user?.token == null) {
      _user = User(
        isFirstSeeSwipeTutorial: false,
        isFirstVisitApp: true,
        token: emptyString,
        createDate: DateTime.now(),
        refreshToken: emptyString,
        ttlToken: emptyString,
      );
      return null;
    } else {
      return Token(
        token: _user!.token!,
        refreshToken: _user!.refreshToken!,
        createDate: _user!.createDate!,
        ttlToken: _user!.ttlToken!,
      );
    }
  }

  void saveInformation(Token? token) async {
    logger.d('Save information');

    User user;
    if (token != null) {
      user = User(
        token: token.token,
        refreshToken: token.refreshToken,
        createDate: token.createDate,
        ttlToken: token.ttlToken,
        isFirstSeeSwipeTutorial: _user!.isFirstSeeSwipeTutorial,
        isFirstVisitApp: _user!.isFirstVisitApp,
      );
    } else {
      user = User(
        isFirstSeeSwipeTutorial: _user!.isFirstSeeSwipeTutorial,
        isFirstVisitApp: _user!.isFirstVisitApp,
      );
    }
    try {
      final Box<User> box = Hive.box<User>(hiveBoxNameUser);
      await box.put(userKey, user);
    } catch (error) {
      logger.e(error);
    }
  }

  void clear() async {
    final Box<User> box = Hive.box<User>(hiveBoxNameUser);
    await box.clear();
    _user!.isFirstVisitApp = true;
    _user!.isFirstSeeSwipeTutorial = false;
  }

  void visitApp() {
    _user!.isFirstVisitApp = false;
    final Token? token = RouteService.instance.navigatorKey.currentState!.context.read<ApplicationTokenCubit>().state.token;
    saveInformation(token);
  }

  void seeSwipeTutorial() {
    _user!.isFirstSeeSwipeTutorial = true;
    final Token? token = RouteService.instance.navigatorKey.currentState!.context.read<ApplicationTokenCubit>().state.token;
    saveInformation(token);
  }

  bool isFirstVisitApp() => _user!.isFirstVisitApp;

  bool isFirstSeeSwipeTutorial() => _user!.isFirstSeeSwipeTutorial;
}
