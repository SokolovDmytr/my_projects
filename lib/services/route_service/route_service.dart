import 'package:flutter/material.dart';
import 'package:fridge_yellow_team_bloc/services/route_service/app_routes.dart';
import 'package:fridge_yellow_team_bloc/ui/pages/auth_page/auth_page.dart';
import 'package:fridge_yellow_team_bloc/ui/pages/home_page/home_page.dart';
import 'package:fridge_yellow_team_bloc/ui/pages/notification_page/notification_page.dart';
import 'package:fridge_yellow_team_bloc/ui/pages/on_boarding_screen/on_boarding_screen.dart';
import 'package:fridge_yellow_team_bloc/ui/pages/settings_page/settings_page.dart';
import 'package:fridge_yellow_team_bloc/ui/pages/splash_screen/splash_screen.dart';

class RouteService {
  // region [Initialize]
  static const String tag = '[RouteHelper]';

  static final RouteService _instance = RouteService._privateConstructor();

  static RouteService get instance => _instance;

  RouteService._privateConstructor();

  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  // endregion
  Route<dynamic> onGenerateRoute(
    RouteSettings settings,
  ) {
    switch (settings.name) {
      case AppRoutes.splashScreenPage:
        return _defaultRoute(
          settings: settings,
          page: SplashScreen(),
        );
      case AppRoutes.homePage:
        return _defaultRoute(
          settings: settings,
          page: HomePage(),
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
      // case AppRoutes.favorites:
      //   return _defaultRoute(
      //     settings: settings,
      //     page: FavouritesPage(),
      //   );
      case AppRoutes.onBoardingScreen:
        return _defaultRoute(
          settings: settings,
          page: OnBoardingScreen(),
        );
      // case AppRoutes.recipes:
      //   return _defaultRoute(
      //     settings: settings,
      //     page: RecipesPage(),
      //   );
      // case AppRoutes.screenRecipePage:
      //   return _defaultRoute(
      //     settings: settings,
      //     page: ScreenRecipePage(),
      //   );
      case AppRoutes.auth:
        return _defaultRoute(
          settings: settings,
          page: AuthPage(),
        );
      default:
        return _defaultRoute(
          settings: settings,
          page: HomePage(),
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
