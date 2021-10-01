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
  String loadingText;

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
    @required this.loadingText,
  });
}
