import 'package:flutter/material.dart';
import 'package:yellow_team_fridge/dictionary/data/en.dart';
import 'package:yellow_team_fridge/dictionary/data/he.dart';
import 'package:yellow_team_fridge/dictionary/data/ru.dart';
import 'package:yellow_team_fridge/dictionary/models/supported_language.dart';
import 'package:yellow_team_fridge/res/locales.dart';

class SupportedLocales {
  List<SupportedLanguage> _supportedLocales;

  SupportedLocales._() {
    _supportedLocales = <SupportedLanguage>[
      SupportedLanguage(
        languageCode: 'en',
        language: en,
      )..choose(),
      SupportedLanguage(
        languageCode: 'ru',
        language: ru,
      ),
      SupportedLanguage(
        languageCode: 'he',
        language: he,
      ),
    ];
  }

  static SupportedLocales instance = SupportedLocales._();

  void changeLocale(String languageCode) {
    _supportedLocales.firstWhere((SupportedLanguage supLang) => supLang.isSelected)?.discard();
    _supportedLocales.firstWhere((SupportedLanguage supLang) => supLang.languageCode == languageCode)?.choose();
  }

  List<Locale> get getSupportedLocales {
    return _supportedLocales?.map((SupportedLanguage supLang) => supLang.getLocale)?.toList() ?? <SupportedLanguage>[];
  }

  String get getCurrentLocale {
    return _supportedLocales?.firstWhere((SupportedLanguage supLang) => supLang.isSelected)?.languageCode ??
        Locales.base;
  }

  SupportedLanguage getSupportedLanguage(Locale locale) {
    return _supportedLocales.firstWhere((SupportedLanguage supLang) => supLang.languageCode == locale.languageCode);
  }
}
