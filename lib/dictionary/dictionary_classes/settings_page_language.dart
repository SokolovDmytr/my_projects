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

  SettingsPageLanguage({
    @required this.youSureWantToExit,
    @required this.settings,
    @required this.back,
    @required this.language,
    @required this.aboutCompany,
    @required this.description,
    @required this.buttonNo,
    @required this.buttonOk,
  });

  factory SettingsPageLanguage.fromJson(Map<String, dynamic> json) {
    return SettingsPageLanguage(
      language: json['language'],
      aboutCompany: json['aboutCompany'],
      back: json['back'],
      description: json['description'],
      settings: json['settings'],
      youSureWantToExit: json['youSureWantToExit'],
      buttonOk: json['buttonOk'],
      buttonNo: json['buttonNo'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'description': description,
      'settings': settings,
      'language': language,
      'back': back,
      'aboutCompany': aboutCompany,
      'youSureWantToExit': youSureWantToExit,
      'buttonOk': buttonOk,
      'buttonNo': buttonNo,
    };
  }
}
