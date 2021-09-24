import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/foundation.dart';
import 'package:redux/redux.dart';
import 'package:yellow_team_fridge/store/application/app_state.dart';
import 'package:yellow_team_fridge/store/on_boarding_screen_state/on_boarding_screen_selectors.dart';

class OnBoardingScreenViewModel {
  final int currentIndexDots;
  final CarouselController buttonCarouselController;
  final void Function() nextSlide;
  final void Function() startUsage;

  OnBoardingScreenViewModel({
    @required this.currentIndexDots,
    @required this.buttonCarouselController,
    @required this.startUsage,
    @required this.nextSlide,
  });

  static OnBoardingScreenViewModel init(Store<AppState> store) {
    return OnBoardingScreenViewModel(
      currentIndexDots: OnBoardingScreenSelectors.getCurrentDotsIndex(store),
      buttonCarouselController: OnBoardingScreenSelectors.getButtonCarouselController(store),
      nextSlide: OnBoardingScreenSelectors.nextSlide(store),
      startUsage: OnBoardingScreenSelectors.startUsage(store),
    );
  }
}
