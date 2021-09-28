import 'package:flutter/cupertino.dart';
import 'package:redux/redux.dart';
import 'package:yellow_team_fridge/store/application/app_state.dart';
import 'package:yellow_team_fridge/store/language_state/language_selectors.dart';

class ApplicationViewModel {
  final String language;
  final void Function(String languageCode) setLanguage;

  ApplicationViewModel({
    @required this.language,
    @required this.setLanguage,
  });

  static ApplicationViewModel init(Store<AppState> store) {
    return ApplicationViewModel(
      language: LanguageSelectors.getCurrentLanguage(store),
      setLanguage: LanguageSelectors.setLanguage(store),
    );
  }
}
