import 'package:fridge_yellow_team_bloc/models/pages/freezed/ingredient.dart';
import 'package:fridge_yellow_team_bloc/models/pages/freezed/recipe.dart';
import 'package:fridge_yellow_team_bloc/models/pages/freezed/token.dart';
import 'package:fridge_yellow_team_bloc/res/const.dart';
import 'package:fridge_yellow_team_bloc/services/network_service/models/base_http_response.dart';

class FridgeParser {
  static final FridgeParser _instance = FridgeParser._();

  static FridgeParser get instance => _instance;

  FridgeParser._();

  List<dynamic> parseList({
    required Type exampleObject,
    required BaseHttpResponse response,
  }) {
    if (exampleObject == Recipe) {
      final List<Recipe> result = [];
      try {
        for (var item in response.response) {
          result.add(Recipe.fromJson(item));
        }
      }catch(error){
        logger.e('Try parse $exampleObject: $error');
      }

      return result;
    }

    if (exampleObject == Ingredient) {
      final List<Ingredient> result = [];
      try {
        for (var item in response.response) {
          result.add(
            Ingredient.fromJson(item),
          );
        }
      }catch(error){
        logger.e('Try parse $exampleObject: $error');
      }

      return result;
    }

    return [];
  }

  dynamic parseEntity({
    required Type exampleObject,
    required BaseHttpResponse response,
  }) {
    if (exampleObject == Token) {
      return Token.fromJson(response.response);
    }
  }
}
