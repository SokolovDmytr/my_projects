import 'dart:collection';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:redux/redux.dart';
import 'package:yellow_team_fridge/res/app_duration.dart';
import 'package:yellow_team_fridge/services/route_service/app_routes.dart';
import 'package:yellow_team_fridge/store/application/app_state.dart';
import 'package:yellow_team_fridge/store/on_boarding_screen_state/actions/next_action.dart';
import 'package:yellow_team_fridge/store/on_boarding_screen_state/actions/start_action.dart';
import 'package:yellow_team_fridge/store/shared/reducer.dart' as my_redux;
import 'package:yellow_team_fridge/store/shared/route_state/route_selectors.dart';

class OnBoardingScreenState {
  final int currentIndexDots;
  final CarouselController buttonCarouselController;

  OnBoardingScreenState({
    this.currentIndexDots,
    this.buttonCarouselController,
  });

  factory OnBoardingScreenState.initial() {
    return OnBoardingScreenState(
      currentIndexDots: 0,
      buttonCarouselController: CarouselController(),
    );
  }

  OnBoardingScreenState copyWith(
    int currentIndexDots,
    CarouselController buttonCarouselController,
  ) {
    return OnBoardingScreenState(
      currentIndexDots: currentIndexDots ?? this.currentIndexDots,
      buttonCarouselController: buttonCarouselController ?? this.buttonCarouselController,
    );
  }

  OnBoardingScreenState reducer(dynamic action) {
    return my_redux.Reducer<OnBoardingScreenState>(
      actions: HashMap.from({
        NextAction: (dynamic action) => _nextAction(),
        StartAction: (dynamic action) => _startAction(action.store),
      }),
    ).updateState(action, this);
  }

  OnBoardingScreenState _startAction(Store<AppState> store) {
    RouteSelectors.pushNamed(store: store, route: AppRoutes.homePage);
    return OnBoardingScreenState();
  }

  OnBoardingScreenState _nextAction() {
    buttonCarouselController.animateToPage(
      currentIndexDots + 1,
      duration: AppDuration.onboardingScreenDuration,
    );
    return OnBoardingScreenState(
      currentIndexDots: currentIndexDots + 1,
      buttonCarouselController: buttonCarouselController,
    );
  }
}
