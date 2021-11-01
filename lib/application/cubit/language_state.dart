import 'package:flutter/cupertino.dart';

class LanguageState {
  final String currentLocale;

  LanguageState({
    required this.currentLocale,
  });

  LanguageState copyWith(
      String? currentLocale,
  ) {
    return LanguageState(currentLocale: currentLocale ?? this.currentLocale);
  }
}
