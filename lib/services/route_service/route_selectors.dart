import 'package:fridge_yellow_team_bloc/models/pages/freezed/ingredient.dart';
import 'package:fridge_yellow_team_bloc/models/pages/models/screen_recipe_arguments.dart';
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

  static void Function() goToRecipesPage({required List<Ingredient> ingredients}) {
    return () => RouteManager.instance.push(
          route: AppRoutes.recipes,
          arguments: ingredients,
        );
  }

  static void Function() goToScreenRecipePage({
    required ScreenRecipeArguments arguments,
  }) {
    return () => RouteManager.instance.push(
          route: AppRoutes.screenRecipePage,
          arguments: arguments,
        );
  }

  static void Function() goToScreenRecipePageReplace({required ScreenRecipeArguments arguments}) {
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
