import 'package:fridge_yellow_team_bloc/dictionary/flutter_delegate.dart';
import 'package:fridge_yellow_team_bloc/res/const.dart';
import 'package:fridge_yellow_team_bloc/services/network_service/models/base_http_response.dart';
import 'package:fridge_yellow_team_bloc/services/network_service/network_service.dart';
import 'package:fridge_yellow_team_bloc/services/network_service/res/consts.dart';
import 'package:fridge_yellow_team_bloc/services/network_service/res/request_params/get_ingredients_params.dart';

class IngredientRepository {
  static final IngredientRepository _instance = IngredientRepository._();

  static IngredientRepository get instance => _instance;

  IngredientRepository._();

  Future<BaseHttpResponse> fetchAllIngredientData({
    required String token,
  }) async {
    NetworkService.instance.init(baseUrl: baseUrl);

    return await NetworkService.instance.requestWithParams(
      type: HttpType.httpGet,
      route: HttpRoute.getIngredients,
      parameter: GetIngredientsParams(
        token: token,
        locale: FlutterDictionaryDelegate.getCurrentLocale,
        str: emptyString,
      ),
    );
  }

  Future<BaseHttpResponse> fetchIngredientData({
    required String token,
    required String ingredientName,
  }) async {
    NetworkService.instance.init(baseUrl: baseUrl);

    return await NetworkService.instance.requestWithParams(
      type: HttpType.httpGet,
      route: HttpRoute.getIngredients,
      parameter: GetIngredientsParams(
        token: token,
        locale: FlutterDictionaryDelegate.getCurrentLocale,
        str: ingredientName,
      ),
    );
  }
}
