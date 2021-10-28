import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:fridge_yellow_team_bloc/res/const.dart';

part 'ingredient.freezed.dart';

part 'ingredient.g.dart';

@freezed
abstract class Ingredient with _$Ingredient {
  const factory Ingredient({
    @Default(emptyString) String i,
    @Default(0) int id,
    @Default(emptyString) String count,
    @Default(emptyString) description,
    @Default(emptyString) name,
    @Default(emptyString) image,
  }) = _Ingredient;

  factory Ingredient.fromJson(Map<String, dynamic> json) => _$IngredientFromJson(json);
}
