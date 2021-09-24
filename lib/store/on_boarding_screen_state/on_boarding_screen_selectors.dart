import 'package:carousel_slider/carousel_slider.dart';
import 'package:redux/redux.dart';
import 'package:yellow_team_fridge/store/application/app_state.dart';
import 'package:yellow_team_fridge/store/on_boarding_screen_state/actions/next_action.dart';
import 'package:yellow_team_fridge/store/on_boarding_screen_state/actions/start_action.dart';

class OnBoardingScreenSelectors {

  static int getCurrentDotsIndex(Store<AppState> store) {
    return store.state.onBoardingScreenState.currentIndexDots;
  }

  static CarouselController getButtonCarouselController(Store<AppState> store) {
    return store.state.onBoardingScreenState.buttonCarouselController;
  }
  static void Function() nextSlide(Store<AppState> store) {
    return () => store.dispatch(NextAction());
  }

  static void Function() startUsage(Store<AppState> store) {
    return () => store.dispatch(StartAction());
  }
}