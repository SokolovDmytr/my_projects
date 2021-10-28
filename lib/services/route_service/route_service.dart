import 'package:flutter/material.dart';
import 'package:fridge_yellow_team_bloc/services/route_service/app_routes.dart';

class RouteService {
  // region [Initialize]
  static const String tag = '[RouteHelper]';

  RouteService._privateConstructor();

  static final RouteService _instance = RouteService._privateConstructor();

  static RouteService get instance => _instance;

  // endregion
  Route<dynamic> onGenerateRoute({
    required RouteSettings settings,
  }) {
    switch (settings.name) {
      case AppRoutes.splashScreenPage:
        return _defaultRoute(
          settings: settings,
          page: SplashScreen(),
        );
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
          settings: settings,
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
      case AppRoutes.auth:
        return _defaultRoute(
          settings: settings,
          page: AuthPage(),
        );
      default:
        return _defaultRoute(
          settings: settings,
          page: MainPage(),
        );
    }
  }

  static PageRoute _defaultRoute({
    required RouteSettings settings,
    required Widget page,
  }) {
    return MaterialPageRoute(
      settings: settings,
      builder: (BuildContext context) => page,
    );
  }
}
