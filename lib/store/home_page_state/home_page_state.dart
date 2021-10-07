import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:yellow_team_fridge/models/pages/ingredient.dart';
import 'package:yellow_team_fridge/store/home_page_state/action/add_ingredient_action.dart';
import 'package:yellow_team_fridge/store/home_page_state/action/clear_ingredient_list_action.dart';
import 'package:yellow_team_fridge/store/home_page_state/action/clear_temp_ingredient_list_action.dart';
import 'package:yellow_team_fridge/store/home_page_state/action/delete_ingredient_action.dart';
import 'package:yellow_team_fridge/store/home_page_state/action/hide_loader.dart';
import 'package:yellow_team_fridge/store/home_page_state/action/save_temp_ingredients_action.dart';
import 'package:yellow_team_fridge/store/home_page_state/action/show_loader.dart';
import 'package:yellow_team_fridge/store/shared/reducer.dart';
import 'package:yellow_team_fridge/store/home_page_state/action/save_all_ingredient_action.dart';

class HomePageState {
  final bool needLoader;
  final List<Ingredient> ingredients;
  final List<Ingredient> tempIngredients;
  final List<Ingredient> allIngredient;

  const HomePageState({
    @required this.needLoader,
    @required this.ingredients,
    @required this.tempIngredients,
    @required this.allIngredient,
  });

  factory HomePageState.initial() {
    return HomePageState(
      needLoader: false,
      ingredients: [],
      tempIngredients: [],
      allIngredient: [],
    );
  }

  HomePageState copyWith({
    bool inputNeedLoader,
    List<Ingredient> inputIngredients,
    List<Ingredient> inputTempIngredients,
    List<Ingredient> inputAllIngredient,
  }) {
    return HomePageState(
      needLoader: inputNeedLoader ?? needLoader,
      ingredients: inputIngredients ?? ingredients,
      tempIngredients: inputTempIngredients ?? tempIngredients,
      allIngredient: inputAllIngredient ?? allIngredient,
    );
  }

  HomePageState reducer(dynamic action) {
    return Reducer<HomePageState>(
      actions: HashMap.from({
        SaveTempIngredientsAction: (dynamic action) => _saveTempIngredients(action),
        DeleteIngredientAction: (dynamic action) => _deleteIngredient(action),
        AddIngredientAction: (dynamic action) => _addIngredient(action),
        ClearTempIngredientListAction: (dynamic action) => _clearTempIngredientList(),
        ClearIngredientListAction: (dynamic action) => _clearIngredientList(),
        SaveAllIngredientAction: (dynamic action) => _saveAllIngrdient(action),
        ShowLoaderAction: (dynamic action) => _showLoader(),
        HideLoaderAction: (dynamic action) => _hideLoader(),
      }),
    ).updateState(action, this);
  }

  HomePageState _saveTempIngredients(SaveTempIngredientsAction action) {
    return copyWith(
      inputTempIngredients: action.ingredients,
    );
  }

  HomePageState _deleteIngredient(DeleteIngredientAction action) {
    final List<Ingredient> list = ingredients..removeWhere((element) => element.i == action.id);

    return copyWith(
      inputIngredients: list,
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

  HomePageState _clearTempIngredientList() {
    return copyWith(inputTempIngredients: []);
  }

  HomePageState _clearIngredientList() {
    return copyWith(inputIngredients: []);
  }

  HomePageState _saveAllIngrdient(SaveAllIngredientAction action) {
    return copyWith(inputAllIngredient: action.ingredients);
  }

  HomePageState _showLoader(){
    return copyWith(
      inputNeedLoader: true,
    );
  }

  HomePageState _hideLoader(){
    return copyWith(
      inputNeedLoader: false,
    );
  }
}
