import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:yellow_team_fridge/services/route_service/app_routes.dart';
import 'package:yellow_team_fridge/store/application/app_state.dart';
import 'package:yellow_team_fridge/ui/pages/favourites_page/favourites_page.dart';
import 'package:yellow_team_fridge/ui/pages/main_page/main_page.dart';
import 'package:yellow_team_fridge/ui/pages/notification_page/notification_page.dart';
import 'package:yellow_team_fridge/ui/pages/on_boarding_screen/on_boarding_screen.dart';
import 'package:yellow_team_fridge/ui/pages/recipes_page/recipes_page.dart';
import 'package:yellow_team_fridge/ui/pages/screen_recipe_page/screen_recipe_page.dart';
import 'package:yellow_team_fridge/ui/pages/settings_page/settings_page.dart';

class RouteService {
  // region [Initialize]
  static const String tag = '[RouteHelper]';

  RouteService._privateConstructor();

  static final RouteService _instance = RouteService._privateConstructor();

  static RouteService get instance => _instance;

  final navigatorKey = GlobalKey<NavigatorState>();

  String getCurrentRoute() {
    return (StoreProvider.of(navigatorKey.currentContext).state as AppState)
        .routeState
        .routes
        .last;
  }

  String getPrevRoute() {
    final int length =
        (StoreProvider.of(navigatorKey.currentContext).state as AppState)
            .routeState
            .routes
            .length;
    if (length == 1) {
      return null;
    }

    return (StoreProvider.of(navigatorKey.currentContext).state as AppState)
        .routeState
        .routes[length - 2];
  }

  // endregion
  Route<dynamic> onGenerateRoute({
    @required RouteSettings settings,
  }) {
    switch (settings.name) {
      case AppRoutes.homePage:
        return _defaultRoute(
          settings: settings,
          page: MainPage(),
        );
      case AppRoutes.settings:
        return _defaultRoute(
          settings: settings,
          page: SettingsPage(),
        );
      case AppRoutes.notification:
        return _defaultRoute(
          settings: settings,
          page: NotificationPage(),
        );
      case AppRoutes.favorites:
        return _defaultRoute(
          settings: settings,
          page: FavouritesPage(),
        );
      case AppRoutes.onBoardingScreen:
        return _defaultRoute(
          settings: null,
          page: OnBoardingScreen(),
        );
      case AppRoutes.recipes:
        return _defaultRoute(
          settings: settings,
          page: RecipesPage(),
        );
      case AppRoutes.screenRecipePage:
        return _defaultRoute(
          settings: settings,
          page: ScreenRecipePage(),
        );
      default:
        return _defaultRoute(
          settings: settings,
          page: MainPage(),
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
