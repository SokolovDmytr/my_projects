import 'package:flutter/material.dart';
import 'package:redux_epics/redux_epics.dart';
import 'package:yellow_team_fridge/store/bottom_bar_state/bottom_bar_state.dart';
import 'package:yellow_team_fridge/store/favorite_state/favorite_epics.dart';
import 'package:yellow_team_fridge/store/favorite_state/favorite_state.dart';
import 'package:yellow_team_fridge/store/home_page_state/home_page_epics.dart';
import 'package:yellow_team_fridge/store/home_page_state/home_page_state.dart';
import 'package:yellow_team_fridge/store/language_state/language_state.dart';
import 'package:yellow_team_fridge/store/on_boarding_screen_state/on_boarding_screen_state.dart';
import 'package:yellow_team_fridge/store/recipes_page_state/recipes_page_epics.dart';
import 'package:yellow_team_fridge/store/recipes_page_state/recipes_page_state.dart';
import 'package:yellow_team_fridge/store/screen_recipe_page/screen_recipe_page_state.dart';
import 'package:yellow_team_fridge/store/shared/route_state/route_state.dart';
import 'package:yellow_team_fridge/store/token_state/token_epics.dart';
import 'package:yellow_team_fridge/store/token_state/token_state.dart';

/// Class [AppState], is the main [state] application.
/// It keeps 3, smaller states.
/// Namely, [dialogState], [storageState], [loaderState].
/// First [dialogState], this variable stores the state of dialogs, it is used to call various dialogs.
/// Second [storageState], the primary state, stores all information from all states.
/// The third [loaderState] is required to loading.
class AppState {
  final HomePageState homePageState;
  final RouteState routeState;
  final OnBoardingScreenState onBoardingScreenState;
  final LanguageState languageState;
  final BottomBarState bottomBarState;
  final FavoriteState favoriteState;
  final TokenState tokenState;
  final RecipesPageState recipesPageState;
  final ScreenRecipePageState screenRecipePageState;

  AppState({
    @required this.homePageState,
    @required this.onBoardingScreenState,
    @required this.languageState,
    @required this.routeState,
    @required this.bottomBarState,
    @required this.favoriteState,
    @required this.tokenState,
    @required this.recipesPageState,
    @required this.screenRecipePageState,
  });

  ///All states are initialized in the [initial] function.
  factory AppState.initial() {
    return AppState(
      homePageState: HomePageState.initial(),
      onBoardingScreenState: OnBoardingScreenState.initial(),
      languageState: LanguageState.initial(),
      routeState: RouteState.initial(),
      favoriteState: FavoriteState.initial(),
      bottomBarState: BottomBarState.initial(),
      tokenState: TokenState.initial(),
      recipesPageState: RecipesPageState.initial(),
      screenRecipePageState: ScreenRecipePageState.initial(),
    );
  }

  ///The [getReducer] function is the main Reducer in which you call Reducer, all other states.
  static AppState getReducer(AppState state, dynamic action) {
    return AppState(
      homePageState: state.homePageState.reducer(action),
      onBoardingScreenState: state.onBoardingScreenState.reducer(action),
      languageState: state.languageState.reducer(action),
      routeState: state.routeState.reducer(action),
      favoriteState: state.favoriteState.reducer(action),
      bottomBarState: state.bottomBarState.reducer(action),
      tokenState: state.tokenState.reducer(action),
      recipesPageState: state.recipesPageState.reducer(action),
      screenRecipePageState: state.screenRecipePageState.reducer(action),
    );
  }

  ///In [getAppEpic], call the main epic.
  static final getAppEpic = combineEpics<AppState>([
    FavoriteEpics.indexEpic,
    HomePageEpics.indexEpic,
    TokenEpics.indexEpic,
    RecipesPageEpics.indexEpic,
  ]);
}
