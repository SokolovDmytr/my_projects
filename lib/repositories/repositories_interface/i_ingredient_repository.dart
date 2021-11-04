import 'package:fridge_yellow_team_bloc/services/network_service/models/base_http_response.dart';

abstract class IIngredientRepository{
  Future<BaseHttpResponse> fetchAllIngredientData({
    required String token,
  });

  Future<BaseHttpResponse> fetchIngredientData({
    required String token,
    required String ingredientName,
  });
}