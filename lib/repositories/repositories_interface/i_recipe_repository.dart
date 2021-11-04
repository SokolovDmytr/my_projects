import 'package:fridge_yellow_team_bloc/services/network_service/models/base_http_response.dart';

abstract class IRecipeRepository{
  Future<BaseHttpResponse> fetchRecipesDataWithIds({
    required String token,
    required List<String> ids,
  });

  Future<BaseHttpResponse> fetchFavoriteRecipeData({
    required String token,
  });

  Future<BaseHttpResponse> addToFavorite({
    required String token,
    required String recipeId,
  });

  Future<BaseHttpResponse> removeFromFavorite({
    required String token,
    required String recipeId,
  });
}