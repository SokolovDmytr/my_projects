import 'package:fridge_yellow_team_bloc/dictionary/flutter_delegate.dart';
import 'package:fridge_yellow_team_bloc/services/network_service/models/base_http_response.dart';
import 'package:fridge_yellow_team_bloc/services/network_service/network_service.dart';
import 'package:fridge_yellow_team_bloc/services/network_service/res/consts.dart';
import 'package:fridge_yellow_team_bloc/services/network_service/res/request_params/add_favorite_params.dart';
import 'package:fridge_yellow_team_bloc/services/network_service/res/request_params/get_favorites_params.dart';
import 'package:fridge_yellow_team_bloc/services/network_service/res/request_params/get_recipe_params.dart';
import 'package:fridge_yellow_team_bloc/services/network_service/res/request_params/remove_favorite_params.dart';

class RecipeRepository {
  static final RecipeRepository _instance = RecipeRepository._();

  static RecipeRepository get instance => _instance;

  RecipeRepository._();

  Future<BaseHttpResponse> fetchRecipesDataWithIds({
    required String token,
    required List<String> ids,
  }) async {
    NetworkService.instance.init(baseUrl: baseUrl);

    return await NetworkService.instance.requestWithParams(
      type: HttpType.httpGet,
      route: HttpRoute.getRecipe,
      parameter: GetRecipeParams(
        token: token,
        idList: ids,
        locale: FlutterDictionaryDelegate.getCurrentLocale,
      ),
    );
  }

  Future<BaseHttpResponse> fetchFavoriteRecipeData({
    required String token,
  }) async {
    NetworkService.instance.init(baseUrl: baseUrl);

    return await NetworkService.instance.requestWithParams(
      type: HttpType.httpGet,
      route: HttpRoute.getFavorite,
      parameter: GetFavoritesParams(
        token: token,
        locale: FlutterDictionaryDelegate.getCurrentLocale,
      ),
    );
  }

  Future<BaseHttpResponse> addToFavorite({
    required String token,
    required String recipeId,
  }) async {
    NetworkService.instance.init(baseUrl: baseUrl);
    return await NetworkService.instance.requestWithParams(
      type: HttpType.httpPost,
      route: HttpRoute.addFavorite,
      parameter: AddFavoriteParams(
        recipeId: recipeId,
        token: token,
      ),
    );
  }

  Future<BaseHttpResponse> removeFromFavorite({
    required String token,
    required String recipeId,
  }) async {
    NetworkService.instance.init(baseUrl: baseUrl);
    return await NetworkService.instance.requestWithParams(
      type: HttpType.httpPost,
      route: HttpRoute.removeFavorite,
      parameter: RemoveFavoriteParams(
        recipeId: recipeId,
        token: token,
      ),
    );
  }
}
