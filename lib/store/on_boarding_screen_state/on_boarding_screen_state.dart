import 'dart:collection';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:yellow_team_fridge/store/on_boarding_screen_state/actions/next_action.dart';
import 'package:yellow_team_fridge/store/on_boarding_screen_state/actions/start_action.dart';
import 'package:yellow_team_fridge/store/shared/reducer.dart';

class OnBoardingScreenState {
  final int currentIndexDots;
  final CarouselController buttonCarouselController;
  final BuildContext context;

  OnBoardingScreenState({
    this.currentIndexDots,
    this.buttonCarouselController,
    this.context,
  });

  factory OnBoardingScreenState.initial() {
    return OnBoardingScreenState(
      currentIndexDots: 0,
      buttonCarouselController: CarouselController(),
    );
  }

  OnBoardingScreenState copyWith(
    int currentIndexDots,
    BuildContext context,
    CarouselController buttonCarouselController,
  ) {
    return OnBoardingScreenState(
      currentIndexDots: currentIndexDots ?? this.currentIndexDots,
      context: context ?? this.context,
      buttonCarouselController: buttonCarouselController ?? this.buttonCarouselController,
    );
  }

  OnBoardingScreenState reducer(dynamic action) {
    return Reducer<OnBoardingScreenState>(
      actions: HashMap.from({
        NextAction: (dynamic action) => _nextAction(),
        StartAction: (dynamic action) => _startAction(),
      }),
    ).updateState(action, this);
  }

  OnBoardingScreenState _startAction() {
    buttonCarouselController.animateToPage(1,
      // buttonCarouselController.nextPage(
      duration: Duration(milliseconds: 300),
    );
    // Navigator.of(context).pop();
    return OnBoardingScreenState(
      currentIndexDots: 0,
      buttonCarouselController: buttonCarouselController,
      context: context,
    );
  }

  OnBoardingScreenState _nextAction() {
    buttonCarouselController.animateToPage(currentIndexDots + 1,
    // buttonCarouselController.nextPage(
      duration: Duration(milliseconds: 300),
    );
    return OnBoardingScreenState(
      currentIndexDots: currentIndexDots + 1,
      buttonCarouselController: buttonCarouselController,
      context: context,
    );
  }
}
