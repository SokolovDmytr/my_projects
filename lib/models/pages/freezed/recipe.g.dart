// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'recipe.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Recipe _$_$_RecipeFromJson(Map<String, dynamic> json) {
  return _$_Recipe(
    i: json['i'] as int ?? -1,
    name: json['name'] as String ?? '',
    image: json['image'] as String ?? '',
    time: json['time'] ?? 0,
    calories: (json['calories'] as num)?.toDouble() ?? 0.0,
    level: json['level'] as String ?? '',
    ingredients: (json['ingredients'] as List)?.map((e) => e == null ? null : Ingredient.fromJson(e as Map<String, dynamic>))?.toList() ?? [],
    steps: (json['steps'] as List)?.map((e) => e as String)?.toList() ?? [],
    isFavorite: json['isFavorite'] as bool ?? false,
  );
}

Map<String, dynamic> _$_$_RecipeToJson(_$_Recipe instance) => <String, dynamic>{
      'i': instance.i,
      'name': instance.name,
      'image': instance.image,
      'time': instance.time,
      'calories': instance.calories,
      'level': instance.level,
      'ingredients': instance.ingredients,
      'steps': instance.steps,
      'isFavorite': instance.isFavorite,
    };
