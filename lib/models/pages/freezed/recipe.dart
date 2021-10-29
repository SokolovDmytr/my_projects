import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:fridge_yellow_team_bloc/models/pages/freezed/ingredient.dart';

part 'recipe.freezed.dart';
part 'recipe.g.dart';

@freezed
class Recipe with _$Recipe {
  const factory Recipe({
    required int i,
    required String name,
    required int time,
    required double calories,
    required List<Ingredient> ingredients,
    required List<String> steps,
    String? level,
    String? image,
    @Default(false) bool isFavorite
  }) = _Recipe;


  factory Recipe.fromJson(Map<String, dynamic> json) => _$RecipeFromJson(json);
}
