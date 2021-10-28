// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ingredient.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Ingredient _$$_IngredientFromJson(Map<String, dynamic> json) => _$_Ingredient(
      i: json['i'] is int ? (json['i'] as int).toString() : json['i'] as String,
      id: json['id'] as int == null
          ? json['i'] is int
              ? (json['i'] as int)
              : int.parse(json['i'] as String)
          : json['id'] as int,
      count: json['count'] as String?,
      description: json['description'] as String?,
      name: json['name'] as String?,
      image: json['image'] as String?,
    );

Map<String, dynamic> _$$_IngredientToJson(_$_Ingredient instance) => <String, dynamic>{
      'i': instance.i,
      'id': instance.id,
      'count': instance.count,
      'description': instance.description,
      'name': instance.name,
      'image': instance.image,
    };
