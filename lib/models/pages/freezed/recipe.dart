import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:fridge_yellow_team_bloc/models/pages/freezed/ingredient.dart';
import 'package:fridge_yellow_team_bloc/res/const.dart';

part 'recipe.freezed.dart';
part 'recipe.g.dart';

@freezed
abstract class Recipe with _$Recipe {
  const factory Recipe({
    @Default(-1) int i,
    @Default(emptyString) String name,
    @Default(emptyString) String image,
    @Default(0) time,
    @Default(0.0) double calories,
    @Default(emptyString) String level,
    @Default([]) List<Ingredient> ingredients,
    @Default([]) List<String> steps,
    @Default(false) bool isFavorite,
  }) = _Recipe;


  factory Recipe.fromJson(Map<String, dynamic> json) => _$RecipeFromJson(json);
}
