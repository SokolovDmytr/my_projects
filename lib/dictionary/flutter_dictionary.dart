import 'package:flutter/material.dart';
import 'package:memes/dictionary/flutter_delegate.dart';
import 'package:memes/dictionary/models/language.dart';
import 'package:memes/res/consts.dart';
import 'package:memes/res/locales.dart';

class FlutterDictionary {
  static const String tag = '[FlutterDictionary]';

  FlutterDictionary._privateConstructor({this.locale});

  static final FlutterDictionary _instance = FlutterDictionary._privateConstructor();

  static FlutterDictionary get instance => _instance;

  final Locale? locale;
  late Language language;

  FlutterDictionary(this.locale);

  void setNewLanguage(String languageCode) {
    logger.d('$tag => setNewLanguage() => locale => $languageCode');
    FlutterDictionaryDelegate.changeLocaleWithLanguageCode(languageCode);
    language = FlutterDictionaryDelegate.getLanguageByLanguageCode(languageCode);
  }

  void setNewLanguageAndSave(String languageCode) {
    logger.d('$tag => setNewLanguageAndSave() => locale => $languageCode');
    language = FlutterDictionaryDelegate.getLanguageByLanguageCode(languageCode);
  }

  static const List<String> _rtlLanguages = <String>[
    Locales.he,
    Locales.ps,
    Locales.ur,
    Locales.ar,
    Locales.fa,
  ];

  bool get isRTL {
    return _rtlLanguages.contains(FlutterDictionaryDelegate.getCurrentLocale);
  }
}
