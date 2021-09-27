import 'package:flutter/material.dart';

class DialogLanguage {
  String loginPopUpTitle;
  String loginPopUpNewVersionText;
  String loginPopUpButtonText;

  String logOutPopUpTitle;
  String logOutPopUpAppName;
  String logOutPopUpButtonNoText;
  String logOutPopUpButtonYesText;

  String favoritesRemovedPopUpText;

  String popUpConnectionError;

  String recipePopUpAddedText;

  String deletePopUpTitle;
  String deletePopUpButtonOkText;
  String deletePopUpButtonCancelText;

  String defaultErrorText;

  DialogLanguage({
    @required this.loginPopUpTitle,
    @required this.loginPopUpNewVersionText,
    @required this.loginPopUpButtonText,
    @required this.logOutPopUpTitle,
    @required this.logOutPopUpAppName,
    @required this.logOutPopUpButtonNoText,
    @required this.logOutPopUpButtonYesText,
    @required this.favoritesRemovedPopUpText,
    @required this.popUpConnectionError,
    @required this.recipePopUpAddedText,
    @required this.deletePopUpTitle,
    @required this.deletePopUpButtonOkText,
    @required this.deletePopUpButtonCancelText,
    @required this.defaultErrorText,
  });

  factory DialogLanguage.fromJson(Map<String, dynamic> json) {
    return DialogLanguage(
      loginPopUpTitle: json['loginPopUpTitle'],
      loginPopUpNewVersionText: json['loginPopUpNewVersionText'],
      loginPopUpButtonText: json['loginPopUpButtonText'],
      logOutPopUpTitle: json['logOutPopUpTitle'],
      logOutPopUpAppName: json['logOutPopUpAppName'],
      logOutPopUpButtonNoText: json['logOutPopUpButtonNoText'],
      logOutPopUpButtonYesText: json['logOutPopUpButtonYesText'],
      favoritesRemovedPopUpText: json['favoritesRemovedPopUpText'],
      popUpConnectionError: json['popUpConnectionError'],
      recipePopUpAddedText: json['recipePopUpAddedText'],
      deletePopUpTitle: json['deletePopUpTitle'],
      deletePopUpButtonOkText: json['deletePopUpButtonOkText'],
      deletePopUpButtonCancelText: json['deletePopUpButtonDeleteText'],
      defaultErrorText: json['defaultErrorText'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'loginPopUpTitle': this.loginPopUpTitle,
      'loginPopUpNewVersionText': this.loginPopUpNewVersionText,
      'loginPopUpButtonText': this.loginPopUpButtonText,
      'logOutPopUpTitle': this.logOutPopUpTitle,
      'logOutPopUpAppName': this.logOutPopUpAppName,
      'logOutPopUpButtonNoText': this.logOutPopUpButtonNoText,
      'logOutPopUpButtonYesText': this.logOutPopUpButtonYesText,
      'favoritesRemovedPopUpText': this.favoritesRemovedPopUpText,
      'popUpConnectionError': this.popUpConnectionError,
      'recipePopUpAddedText': this.recipePopUpAddedText,
      'deletePopUpTitle': this.deletePopUpTitle,
      'deletePopUpButtonOkText': this.deletePopUpButtonOkText,
      'deletePopUpButtonDeleteText': this.deletePopUpButtonCancelText,
      'defaultErrorText': this.defaultErrorText,
    };
  }
}
