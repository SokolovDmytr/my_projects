import 'package:flutter/material.dart';
import 'package:redux_epics/redux_epics.dart';
import 'package:yellow_team_fridge/store/language_state/language_state.dart';
import 'package:yellow_team_fridge/store/on_boarding_screen_state/on_boarding_screen_state.dart';
import 'package:yellow_team_fridge/store/recipes/recipes_state.dart';
import 'package:yellow_team_fridge/store/shared/route_state/route_state.dart';

/// Class [AppState], is the main [state] application.
/// It keeps 3, smaller states.
/// Namely, [dialogState], [storageState], [loaderState].
/// First [dialogState], this variable stores the state of dialogs, it is used to call various dialogs.
/// Second [storageState], the primary state, stores all information from all states.
/// The third [loaderState] is required to loading.
class AppState {
  final RouteState routeState;
  final OnBoardingScreenState onBoardingScreenState;
  final LanguageState languageState;
  final RecipesState recipesState;

  AppState({
    @required this.onBoardingScreenState,
    @required this.languageState,
    @required this.routeState,
    @required this.recipesState,
  });

  ///All states are initialized in the [initial] function.
  factory AppState.initial() {
    return AppState(
      onBoardingScreenState: OnBoardingScreenState.initial(),
      languageState: LanguageState.initial(),
      routeState: RouteState.initial(),
      recipesState: RecipesState.initial(),
    );
  }

  ///The [getReducer] function is the main Reducer in which you call Reducer, all other states.
  static AppState getReducer(AppState state, dynamic action) {
    return AppState(
      onBoardingScreenState: state.onBoardingScreenState.reducer(action),
      languageState: state.languageState.reducer(action),
      routeState: state.routeState.reducer(action),
      recipesState: state.recipesState.reducer(action),
    );
  }

  ///In [getAppEpic], call the main epic.
  static final getAppEpic = combineEpics<AppState>([]);
}
