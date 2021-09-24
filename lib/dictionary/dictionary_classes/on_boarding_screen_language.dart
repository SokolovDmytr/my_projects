import 'package:flutter/material.dart';
class OnBoardingScreenLanguage {
  final String onBoardingScreenOne;
  final String onBoardingScreenTwo;
  final String onBoardingScreenThree;
  final String onBoardingScreenFour;
  final String buttonNext;
  final String buttonStart;

  OnBoardingScreenLanguage({
    @required this.onBoardingScreenOne,
    @required this.onBoardingScreenTwo,
    @required this.onBoardingScreenThree,
    @required this.onBoardingScreenFour,
    @required this.buttonNext,
    @required this.buttonStart,
  });

  factory OnBoardingScreenLanguage.fromJson(Map<String, dynamic> json) {
    return OnBoardingScreenLanguage(
      onBoardingScreenOne: json['onBoardingScreenOne'],
      onBoardingScreenTwo: json['onBoardingScreenTwo'],
      onBoardingScreenThree: json['onBoardingScreenThree'],
      onBoardingScreenFour: json['onBoardingScreenFour'],
      buttonNext: json['buttonNext'],
      buttonStart: json['buttonStart'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'onBoardingScreenOne': onBoardingScreenOne,
      'onBoardingScreenTwo': onBoardingScreenTwo,
      'onBoardingScreenThree': onBoardingScreenThree,
      'onBoardingScreenFour': onBoardingScreenFour,
      'buttonNext': buttonNext,
      'buttonStart': buttonStart,
    };
  }
}
