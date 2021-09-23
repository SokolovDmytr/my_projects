import 'package:flutter/material.dart';
import 'package:yellow_team_fridge/dictionary/models/language.dart';

class SupportedLanguage {
  final String languageCode;
  final Language language;
  bool _isSelected;

  SupportedLanguage({
    @required this.languageCode,
    @required this.language,
  }) {
    _isSelected = false;
  }

  bool get isSelected => _isSelected;

  void choose() => _isSelected = true;

  void discard() => _isSelected = false;

  Locale get getLocale => Locale(languageCode);
}
