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

  String serverErrorText;

  String recipePopUpAddedText;

  String deletePopUpTitle;
  String deletePopUpButtonOkText;
  String deletePopUpButtonCancelText;

  String defaultErrorText;
  String defaultSuccessText;

  DialogLanguage({
    @required this.loginPopUpTitle,
    @required this.loginPopUpNewVersionText,
    @required this.loginPopUpButtonText,
    @required this.logOutPopUpTitle,
    @required this.logOutPopUpAppName,
    @required this.logOutPopUpButtonNoText,
    @required this.logOutPopUpButtonYesText,
    @required this.favoritesRemovedPopUpText,
    @required this.serverErrorText,
    @required this.recipePopUpAddedText,
    @required this.deletePopUpTitle,
    @required this.deletePopUpButtonOkText,
    @required this.deletePopUpButtonCancelText,
    @required this.defaultErrorText,
    @required this.defaultSuccessText,
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
      serverErrorText: json['serverErrorText'],
      recipePopUpAddedText: json['recipePopUpAddedText'],
      deletePopUpTitle: json['deletePopUpTitle'],
      deletePopUpButtonOkText: json['deletePopUpButtonOkText'],
      deletePopUpButtonCancelText: json['deletePopUpButtonDeleteText'],
      defaultErrorText: json['defaultErrorText'],
        defaultSuccessText: json['defaultSuccessText'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'loginPopUpTitle': loginPopUpTitle,
      'loginPopUpNewVersionText': loginPopUpNewVersionText,
      'loginPopUpButtonText': loginPopUpButtonText,
      'logOutPopUpTitle': logOutPopUpTitle,
      'logOutPopUpAppName': logOutPopUpAppName,
      'logOutPopUpButtonNoText': logOutPopUpButtonNoText,
      'logOutPopUpButtonYesText': logOutPopUpButtonYesText,
      'favoritesRemovedPopUpText': favoritesRemovedPopUpText,
      'serverErrorText': serverErrorText,
      'recipePopUpAddedText': recipePopUpAddedText,
      'deletePopUpTitle': deletePopUpTitle,
      'deletePopUpButtonOkText': deletePopUpButtonOkText,
      'deletePopUpButtonDeleteText': deletePopUpButtonCancelText,
      'defaultErrorText': defaultErrorText,
      'defaultSuccessText': defaultSuccessText,
    };
  }
}
