import 'package:flutter/cupertino.dart';
import 'package:redux/redux.dart';
import 'package:yellow_team_fridge/store/application/app_state.dart';
import 'package:yellow_team_fridge/store/bottom_bar_state/bottom_bar_selectors.dart';

class NavigationBottomBarViewModel {
  final void Function() goToHomePage;
  final void Function() goToFavouritesPage;
  final void Function() goToSettingsPage;

  NavigationBottomBarViewModel({
    @required this.goToHomePage,
    @required this.goToFavouritesPage,
    @required this.goToSettingsPage,
  });

  static NavigationBottomBarViewModel init(Store<AppState> store) {
    return NavigationBottomBarViewModel(
      goToHomePage: BottomBarSelectors.goToHomePage(store),
      goToFavouritesPage: BottomBarSelectors.goToFavouritesPage(store),
      goToSettingsPage: BottomBarSelectors.goToSettingsPage(store),
    );
  }
}
