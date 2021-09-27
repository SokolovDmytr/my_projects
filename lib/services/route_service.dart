import 'package:flutter/material.dart';
import 'package:yellow_team_fridge/res/app_routes.dart';
import 'package:yellow_team_fridge/ui/pages/main_page/main_page.dart';
import 'package:yellow_team_fridge/ui/pages/unknow_page/unknow_page.dart';

class RouteService {
  // region [Initialize]
  static const String tag = '[RouteHelper]';

  RouteService._privateConstructor();

  static final RouteService _instance = RouteService._privateConstructor();

  static RouteService get instance => _instance;

  final navigatorKey = GlobalKey<NavigatorState>();

  // endregion
  Route<dynamic> onGenerateRoute({
    @required RouteSettings settings,
  }) {
    switch (settings.name) {
      case AppRoutes.home:
        return _defaultRoute(
          settings: settings,
          page: MainPage(),
        );
      default:
        return _defaultRoute(
          settings: settings,
          page: UnknownPage(),
        );
    }
  }

  static PageRoute _defaultRoute({
    @required RouteSettings settings,
    @required Widget page,
  }) {
    return MaterialPageRoute(
      settings: settings,
      builder: (BuildContext context) => page,
    );
  }
}
