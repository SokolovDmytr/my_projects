import 'package:flutter/material.dart';
import 'package:memes/services/route_service/app_routes.dart';
import 'package:memes/ui/pages/catalog_page/catalog_page.dart';
import 'package:memes/ui/pages/create_meme_page/create_meme_page.dart';
import 'package:memes/ui/pages/splash_screen/splash_screen.dart';

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
      case AppRoutes.splashScreen:
        return _defaultRoute(
          settings: settings,
          page: SplashScreen(),
        );
      case AppRoutes.catalogPage:
        return _defaultRoute(
          settings: settings,
          page: CatalogPage(),
        );
      case AppRoutes.createMemePage:
        return _defaultRoute(
          settings: settings,
          page: CreateMemePage(),
        );
      default:
        return _defaultRoute(
          settings: settings,
          page: CatalogPage(),
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
