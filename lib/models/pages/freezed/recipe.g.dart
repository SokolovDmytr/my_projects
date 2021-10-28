// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'recipe.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Recipe _$$_RecipeFromJson(Map<String, dynamic> json) => _$_Recipe(
      i: json['i'] as int,
      name: json['name'] as String,
      time: json['time'] as int,
      calories: (json['calories'] as num).toDouble(),
      level: json['level'] as String,
      ingredients: (json['ingredients'] as List<dynamic>)
          .map((e) => Ingredient.fromJson(e as Map<String, dynamic>))
          .toList(),
      steps: (json['steps'] as List<dynamic>).map((e) => e as String).toList(),
      image: json['image'] as String?,
      isFavorite: json['isFavorite'] as bool? ?? false,
    );

Map<String, dynamic> _$$_RecipeToJson(_$_Recipe instance) => <String, dynamic>{
      'i': instance.i,
      'name': instance.name,
      'time': instance.time,
      'calories': instance.calories,
      'level': instance.level,
      'ingredients': instance.ingredients,
      'steps': instance.steps,
      'image': instance.image,
      'isFavorite': instance.isFavorite,
    };
