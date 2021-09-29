import 'package:redux/redux.dart';
import 'package:yellow_team_fridge/store/application/app_state.dart';
import 'package:yellow_team_fridge/store/bottom_bar_state/actions/navigate_favourites_action.dart';
import 'package:yellow_team_fridge/store/bottom_bar_state/actions/navigate_home_action.dart';
import 'package:yellow_team_fridge/store/bottom_bar_state/actions/navigate_settings_action.dart';

class BottomBarSelectors {

  static void Function() goToHomePage(Store<AppState> store) {
    return () => store.dispatch(NavigateHomeAction(store: store));
  }

  static void Function() goToFavouritesPage(Store<AppState> store) {
    return () => store.dispatch(NavigateFavouritesAction(store: store));
  }

  static void Function() goToSettingsPage(Store<AppState> store) {
    return () => store.dispatch(NavigateSettingsAction(store: store));
  }
}
