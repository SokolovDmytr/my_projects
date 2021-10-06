import 'package:flutter/material.dart';
import 'package:redux/redux.dart';
import 'package:yellow_team_fridge/store/application/app_state.dart';
import 'package:yellow_team_fridge/store/language_state/language_selectors.dart';
import 'package:yellow_team_fridge/store/shared/route_state/route_selectors.dart';

class NotificationPageViewModel {
  final String language;
  final void Function() onTapBack;

  const NotificationPageViewModel({
    @required this.language,
    @required this.onTapBack,
  });

  static NotificationPageViewModel init(Store<AppState> store) {
    return NotificationPageViewModel(
      language: LanguageSelectors.getCurrentLanguage(store),
      onTapBack: () => RouteSelectors.pop(store: store),
    );
  }
}
