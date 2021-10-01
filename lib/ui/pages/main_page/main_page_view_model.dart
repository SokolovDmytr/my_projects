import 'package:flutter/material.dart';
import 'package:redux/redux.dart';
import 'package:yellow_team_fridge/models/pages/ingredient.dart';
import 'package:yellow_team_fridge/store/application/app_state.dart';
import 'package:yellow_team_fridge/store/home_page_state/home_page_selector.dart';

class MainPageViewModel {
  final List<Ingredient> ingredients;
  final List<Ingredient> tempIngredients;
  final Function(String name) getIngredientsWithName;
  final Function(Ingredient ingredient) addIngredient;
  final Function(String id) deleteIngredient;

  const MainPageViewModel({
    @required this.ingredients,
    @required this.tempIngredients,
    @required this.getIngredientsWithName,
    @required this.addIngredient,
    @required this.deleteIngredient,
  });

  static MainPageViewModel init(
    Store<AppState> store,
  ) {
    return MainPageViewModel(
      ingredients: store.state.homePageState.ingredients,
      tempIngredients: store.state.homePageState.tempIngredients,
      getIngredientsWithName: (String name) => HomePageSelector.getIngredientsWithName(
        store: store,
        name: name,
      ),
      addIngredient: (Ingredient ingredient) => HomePageSelector.addIngredient(
        store: store,
        ingredient: ingredient,
      ),
      deleteIngredient: (String id) => HomePageSelector.deleteIngredient(store: store, id: id)
    );
  }
}
