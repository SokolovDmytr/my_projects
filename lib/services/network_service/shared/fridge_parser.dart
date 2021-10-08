import 'package:flutter/material.dart';
import 'package:yellow_team_fridge/models/pages/ingredient.dart';
import 'package:yellow_team_fridge/models/pages/recipe.dart';
import 'package:yellow_team_fridge/models/pages/token.dart';
import 'package:yellow_team_fridge/services/network_service/models/base_http_response.dart';
import 'package:yellow_team_fridge/services/network_service/shared/ingredient_parser.dart';
import 'package:yellow_team_fridge/services/network_service/shared/recipe_parser.dart';
import 'package:yellow_team_fridge/services/network_service/shared/token_parser.dart';

class FridgeParser {
  static final FridgeParser _instance = FridgeParser._();

  static FridgeParser get instance => _instance;

  RecipeParser _recipeParser;
  IngredientParser _ingredientParser;
  TokenParser _tokenParser;

  FridgeParser._() {
    _recipeParser = RecipeParser();
    _ingredientParser = IngredientParser();
    _tokenParser = TokenParser();
  }

  List<dynamic> parseList({
    @required Type exampleObject,
    @required BaseHttpResponse response,
  }) {
    List<dynamic> result = [];
    if (exampleObject == Recipe) {
      result =  _recipeParser.parse(
        data: response.response,
      );
    }
    if (exampleObject == Ingredient) {
      result = _ingredientParser.parse(
        data: response.response,
      );
    }

    return result;
  }

  dynamic parseEntity({
    @required Type exampleObject,
    @required BaseHttpResponse response,
  }) {
    if (exampleObject == Token) {
      return _tokenParser.parse(
        token: response.response,
      );
    }
  }
}
