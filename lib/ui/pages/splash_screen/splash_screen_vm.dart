import 'package:flutter/material.dart';
import 'package:redux/redux.dart';
import 'package:yellow_team_fridge/services/route_service/app_routes.dart';
import 'package:yellow_team_fridge/store/application/app_state.dart';
import 'package:yellow_team_fridge/store/shared/route_state/route_selectors.dart';

class SplashScreenViewModel {
  void Function() navigateOnBoardingScreen;

  SplashScreenViewModel({
    @required this.navigateOnBoardingScreen,
  });

  static SplashScreenViewModel init(Store<AppState> store) {
    return SplashScreenViewModel(
      navigateOnBoardingScreen: () => RouteSelectors.pushReplaceNamed(
        store: store,
        route: AppRoutes.onBoardingScreen,
      ),
    );
  }
}
