import 'package:flutter/material.dart';
import 'package:memes/dictionary/data/en.dart';
import 'package:memes/dictionary/models/supported_language.dart';
import 'package:memes/res/locales.dart';

class SupportedLocales {
  List<SupportedLanguage>? _supportedLocales;

  SupportedLocales._() {
    _supportedLocales = <SupportedLanguage>[
      SupportedLanguage(
        languageCode: 'en',
        language: en,
      )..choose(),
    ];
  }

  static SupportedLocales instance = SupportedLocales._();

  void changeLocale(String languageCode) {
    _supportedLocales!.firstWhere((SupportedLanguage supLang) => supLang.isSelected).discard();
    _supportedLocales!.firstWhere((SupportedLanguage supLang) => supLang.languageCode == languageCode).choose();
  }

  List<Locale>? get getSupportedLocales {
    return _supportedLocales!.map((SupportedLanguage supLang) => supLang.getLocale).toList();
  }

  String get getCurrentLocale {
    return _supportedLocales?.firstWhere((SupportedLanguage supLang) => supLang.isSelected).languageCode ?? Locales.base;
  }

  SupportedLanguage getSupportedLanguage(Locale locale) {
    return _supportedLocales!.firstWhere((SupportedLanguage supLang) => supLang.languageCode == locale.languageCode);
  }
}
