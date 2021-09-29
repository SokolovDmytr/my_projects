import 'package:flutter/cupertino.dart';
import 'package:redux/redux.dart';
import 'package:yellow_team_fridge/store/application/app_state.dart';
import 'package:yellow_team_fridge/store/language_state/language_selectors.dart';

class LanguageViewModel {
  final String language;
  final void Function(String languageCode) setLanguage;

  LanguageViewModel({
    @required this.language,
    @required this.setLanguage,
  });

  static LanguageViewModel init(Store<AppState> store) {
    return LanguageViewModel(
      language: LanguageSelectors.getCurrentLanguage(store),
      setLanguage: LanguageSelectors.setLanguage(store),
    );
  }
}
