import 'package:flutter/material.dart';
import 'package:redux/redux.dart';
import 'package:yellow_team_fridge/store/application/app_state.dart';
import 'package:yellow_team_fridge/store/language_state/language_selectors.dart';
import 'package:yellow_team_fridge/store/shared/route_state/route_selectors.dart';

class SettingsPageViewModel {
  final String language;
  final void Function() onTapBack;

  const SettingsPageViewModel({
    @required this.language,
    @required this.onTapBack,
  });

  static SettingsPageViewModel init(Store<AppState> store) {
    return SettingsPageViewModel(
      language: LanguageSelectors.getCurrentLanguage(store),
      onTapBack: () => RouteSelectors.pop(store: store),
    );
  }
}
