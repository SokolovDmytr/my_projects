import 'package:flutter/material.dart';
import 'package:yellow_team_fridge/models/pages/recipe.dart';
import 'package:yellow_team_fridge/services/network_service/models/base_http_response.dart';
import 'package:yellow_team_fridge/services/network_service/shared/recipe_parser.dart';

class FridgeParser {
  static final FridgeParser _instance = FridgeParser._();

  static FridgeParser get instance => _instance;

  RecipeParser _recipeParser;

  FridgeParser._() {
    _recipeParser = RecipeParser();
  }

  List<dynamic> parse({
    @required Type exampleObject,
    @required BaseHttpResponse response,
  }) {
    if (exampleObject == Recipe) {
      return _recipeParser.parse(data: response.response);
    }
  }
}
