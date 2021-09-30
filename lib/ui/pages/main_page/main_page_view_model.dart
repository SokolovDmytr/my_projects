import 'package:flutter/material.dart';
import 'package:redux/redux.dart';
import 'package:yellow_team_fridge/models/pages/ingredient.dart';
import 'package:yellow_team_fridge/store/application/app_state.dart';
import 'package:yellow_team_fridge/store/home_page_state/home_page_selector.dart';

class MainPageViewModel {
  final List<Ingredient> ingredients;
  final Function(String name) getIngredientsWithName;

  const MainPageViewModel({
    @required this.ingredients,
    @required this.getIngredientsWithName,
  });

  static MainPageViewModel init(Store<AppState> store,) {
    return MainPageViewModel(
      ingredients: store.state.homePageState.ingredients,
      getIngredientsWithName: (String name) => HomePageSelector.getIngredientsWithName(store: store, name: name,),
    );
  }
}
