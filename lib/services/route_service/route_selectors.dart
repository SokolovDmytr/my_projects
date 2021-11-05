import 'package:fridge_yellow_team_bloc/models/pages/models/screen_recipe_arguments.dart';
import 'package:fridge_yellow_team_bloc/res/const.dart';
import 'package:fridge_yellow_team_bloc/res/typedef.dart';
import 'package:fridge_yellow_team_bloc/services/route_service/app_routes.dart';
import 'package:fridge_yellow_team_bloc/services/route_service/route_manager.dart';

class RouteSelectors {
  static bool get canPop => RouteManager.instance.canPop;

  static VoidFunction doPop() {
    if (canPop) {
      return () => RouteManager.instance.pop();
    }

    return () => RouteManager.instance.pushAndRemoveUntil(
          route: AppRoutes.homePage,
          routeNamePredicate: emptyString,
        );
  }

  static VoidFunction goToAuthPage() {
    return () => RouteManager.instance.pushAndRemoveUntil(
          route: AppRoutes.auth,
          routeNamePredicate: emptyString,
        );
  }

  static VoidFunction goToFavoritesPage() {
    return () => RouteManager.instance.pushAndRemoveUntil(
          route: AppRoutes.favorites,
          routeNamePredicate: AppRoutes.homePage,
        );
  }

  static VoidFunction goToHomePage() {
    return () => RouteManager.instance.pushAndRemoveUntil(
          route: AppRoutes.homePage,
          routeNamePredicate: emptyString,
        );
  }

  static VoidFunction goToNotificationPage() {
    return () => RouteManager.instance.push(route: AppRoutes.notification);
  }

  static VoidFunction goToOnBoardingPage() {
    return () => RouteManager.instance.pushAndRemoveUntil(
          route: AppRoutes.onBoardingScreen,
          routeNamePredicate: emptyString,
        );
  }

  static VoidFunction goToRecipesPage() {
    return () => RouteManager.instance.push(
          route: AppRoutes.recipes,
        );
  }

  static VoidFunction goToScreenRecipePage({
    required ScreenRecipeArguments arguments,
  }) {
    return () => RouteManager.instance.push(
          route: AppRoutes.screenRecipePage,
          arguments: arguments,
        );
  }

  static VoidFunction goToScreenRecipePageReplace({required ScreenRecipeArguments arguments}) {
    return () => RouteManager.instance.replace(
          route: AppRoutes.screenRecipePage,
          arguments: arguments,
          needCheckLastRoute: false,
        );
  }

  static VoidFunction goToSettingsPage() {
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

  static VoidFunction goToSplashScreen() {
    return () => RouteManager.instance.push(route: AppRoutes.splashScreenPage);
  }
}
