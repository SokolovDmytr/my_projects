import 'package:flutter/cupertino.dart';

class SettingsPageLanguage {
  final String settings;
  final String back;
  final String language;
  final String aboutCompany;
  final String description;
  final String youSureWantToExit;
  final String buttonOk;
  final String buttonNo;
  final String notification;
  final String logOut;

  SettingsPageLanguage({
    @required this.youSureWantToExit,
    @required this.settings,
    @required this.back,
    @required this.language,
    @required this.aboutCompany,
    @required this.description,
    @required this.buttonNo,
    @required this.buttonOk,
    @required this.notification,
    @required this.logOut,
  });
}
