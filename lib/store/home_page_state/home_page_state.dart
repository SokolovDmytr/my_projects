import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:yellow_team_fridge/models/pages/ingredient.dart';
import 'package:yellow_team_fridge/store/home_page_state/action/add_ingredient_action.dart';
import 'package:yellow_team_fridge/store/home_page_state/action/delete_ingredient_action.dart';
import 'package:yellow_team_fridge/store/home_page_state/action/save_temp_ingredients_action.dart';
import 'package:yellow_team_fridge/store/shared/reducer.dart';

class HomePageState {
  final List<Ingredient> ingredients;
  final List<Ingredient> tempIngredients;

  HomePageState({
    @required this.ingredients,
    @required this.tempIngredients,
  });

  factory HomePageState.initial() {
    return HomePageState(
      ingredients: [],
      tempIngredients: [],
    );
  }

  HomePageState copyWith({
    List<Ingredient> inputIngredients,
    List<Ingredient> inputTempIngredients,
  }) {
    return HomePageState(
      ingredients: inputIngredients ?? ingredients,
      tempIngredients: inputTempIngredients ?? tempIngredients,
    );
  }

  HomePageState reducer(dynamic action) {
    return Reducer<HomePageState>(
      actions: HashMap.from({
        SaveTempIngredientsAction: (dynamic action) => _saveTempIngredients(action),
        DeleteIngredientAction: (dynamic action) => _deleteIngredient(action),
        AddIngredientAction: (dynamic action) => _addIngredient(action),
        DeleteIngredientAction: (dynamic action) => _clearTempIngredientList(),
      }),
    ).updateState(action, this);
  }

  HomePageState _saveTempIngredients(SaveTempIngredientsAction action) {
    return copyWith(
      inputTempIngredients: action.ingredients,
    );
  }

  HomePageState _deleteIngredient(DeleteIngredientAction action) {
    return copyWith(
      inputIngredients: ingredients..removeWhere((element) => element.i == action.id),
    );
  }

  HomePageState _addIngredient(AddIngredientAction action) {
    if (ingredients.where((element) => element.id == action.ingredient.id).isEmpty) {
      return copyWith(
        inputIngredients: ingredients..add(action.ingredient),
      );
    } else {
      return this;
    }
  }

  HomePageState _clearTempIngredientList(){
    return copyWith(inputTempIngredients: []);
  }
}
