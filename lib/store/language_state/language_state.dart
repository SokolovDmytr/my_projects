import 'dart:collection';

import 'package:yellow_team_fridge/dictionary/flutter_delegate.dart';
import 'package:yellow_team_fridge/dictionary/flutter_dictionary.dart';
import 'package:yellow_team_fridge/store/language_state/actions/set_language_action.dart';
import 'package:yellow_team_fridge/store/shared/reducer.dart';

class LanguageState {
  final String language;

  LanguageState({
    this.language,
  });

  factory LanguageState.initial() {
    return LanguageState(
      language: FlutterDictionaryDelegate.getCurrentLocale,
    );
  }

  LanguageState copyWith(
    String language,
  ) {
    return LanguageState(
      language: language ?? this.language,
    );
  }

  LanguageState reducer(dynamic action) {
    return Reducer<LanguageState>(
      actions: HashMap.from({
        SetLanguageAction: (dynamic action) => _setLanguage(action.languageCode),
      }),
    ).updateState(action, this);
  }

  LanguageState _setLanguage(String languageCode) {
    FlutterDictionary.instance.setNewLanguage(languageCode);
    return LanguageState(
      language: FlutterDictionaryDelegate.getCurrentLocale,
    );
  }
}
