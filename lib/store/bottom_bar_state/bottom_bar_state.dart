import 'dart:collection';

import 'package:redux/redux.dart';
import 'package:yellow_team_fridge/res/app_routes.dart';
import 'package:yellow_team_fridge/store/application/app_state.dart';
import 'package:yellow_team_fridge/store/bottom_bar_state/actions/close_action.dart';
import 'package:yellow_team_fridge/store/bottom_bar_state/actions/navigate_favourites_action.dart';
import 'package:yellow_team_fridge/store/bottom_bar_state/actions/navigate_home_action.dart';
import 'package:yellow_team_fridge/store/bottom_bar_state/actions/navigate_settings_action.dart';
import 'package:yellow_team_fridge/store/bottom_bar_state/actions/show_action.dart';
import 'package:yellow_team_fridge/store/shared/reducer.dart' as my_redux;
import 'package:yellow_team_fridge/store/shared/route_state/route_selectors.dart';

class BottomBarState {
  BottomBarState();

  factory BottomBarState.initial() {
    return BottomBarState();
  }

  BottomBarState copyWith(
    String currentPage,
  ) {
    return BottomBarState();
  }

  BottomBarState reducer(dynamic action) {
    return my_redux.Reducer<BottomBarState>(
      actions: HashMap.from({
        ShowAction: (dynamic action) {},
        CloseAction: (dynamic action) {},
        NavigateHomeAction: (dynamic action) => _navigateHome(action.store),
        NavigateSettingsAction: (dynamic action) => _navigateSettings(action.store),
        NavigateFavouritesAction: (dynamic action) => _navigateFavourites(action.store),
      }),
    ).updateState(action, this);
  }

  BottomBarState _navigateHome(Store<AppState> store) {
    RouteSelectors.pushNamed(store: store, route: AppRoutes.homePage);
    return BottomBarState();
  }

  BottomBarState _navigateSettings(Store<AppState> store) {
    RouteSelectors.pushNamed(store: store, route: AppRoutes.settings,);
    return BottomBarState();
  }

  BottomBarState _navigateFavourites(Store<AppState> store) {
    RouteSelectors.pushNamed(store: store, route: AppRoutes.favorites);
    return BottomBarState();
  }
}
