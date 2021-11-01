import 'package:fridge_yellow_team_bloc/res/const.dart';
import 'package:fridge_yellow_team_bloc/services/route_service/app_routes.dart';
import 'package:fridge_yellow_team_bloc/services/route_service/route_manager.dart';

class RouteSelectors {
  static bool get canPop => RouteManager.instance.canPop;

  static void Function() doPop() {
    if (canPop) {
      return () => RouteManager.instance.pop();
    }

    return () => RouteManager.instance.pushAndRemoveUntil(
          route: AppRoutes.homePage,
          routeNamePredicate: emptyString,
        );
  }

  static void Function() goToAuthPage() {
    return () => RouteManager.instance.pushAndRemoveUntil(
          route: AppRoutes.auth,
          routeNamePredicate: emptyString,
        );
  }

  static void Function() goToFavoritesPage() {
    return () => RouteManager.instance.pushAndRemoveUntil(
          route: AppRoutes.favorites,
          routeNamePredicate: AppRoutes.homePage,
        );
  }

  static void Function() goToHomePage() {
    return () => RouteManager.instance.pushAndRemoveUntil(
          route: AppRoutes.homePage,
          routeNamePredicate: emptyString,
        );
  }

  static void Function() goToNotificationPage() {
    return () => RouteManager.instance.push(route: AppRoutes.notification);
  }

  static void Function() goToOnBoardingPage() {
    return () => RouteManager.instance.pushAndRemoveUntil(
          route: AppRoutes.onBoardingScreen,
          routeNamePredicate: emptyString,
        );
  }

  static void Function() goToRecipesPage() {
    return () => RouteManager.instance.push(route: AppRoutes.recipes);
  }

  static void Function() goToScreenRecipePage() {
    return () => RouteManager.instance.push(route: AppRoutes.screenRecipePage);
  }

  static void Function() goToScreenRecipePageReplace({required Object arguments}) {
    return () => RouteManager.instance.replace(
          route: AppRoutes.screenRecipePage,
          arguments: arguments,
          needCheckLastRoute: false,
        );
  }

  static void Function() goToSettingsPage() {
    return () {
      if (RouteManager.instance.currentRoute == AppRoutes.favorites) {
        return RouteManager.instance.push(route: AppRoutes.settings);
      } else {
        return RouteManager.instance.pushAndRemoveUntil(
          route: AppRoutes.settings,
          routeNamePredicate: AppRoutes.homePage,
        );
      }
    };
  }

  static void Function() goToSplashScreen() {
    return () => RouteManager.instance.push(route: AppRoutes.splashScreenPage);
  }
}
