// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'recipe.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Recipe _$RecipeFromJson(Map<String, dynamic> json) {
  return _Recipe.fromJson(json);
}

/// @nodoc
class _$RecipeTearOff {
  const _$RecipeTearOff();

  _Recipe call(
      {required int i,
      required String name,
      required int time,
      required double calories,
      required List<Ingredient> ingredients,
      required List<String> steps,
      String? level,
      String? image,
      bool isFavorite = false}) {
    return _Recipe(
      i: i,
      name: name,
      time: time,
      calories: calories,
      ingredients: ingredients,
      steps: steps,
      level: level,
      image: image,
      isFavorite: isFavorite,
    );
  }

  Recipe fromJson(Map<String, Object?> json) {
    return Recipe.fromJson(json);
  }
}

/// @nodoc
const $Recipe = _$RecipeTearOff();

/// @nodoc
mixin _$Recipe {
  int get i => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  int get time => throw _privateConstructorUsedError;
  double get calories => throw _privateConstructorUsedError;
  List<Ingredient> get ingredients => throw _privateConstructorUsedError;
  List<String> get steps => throw _privateConstructorUsedError;
  String? get level => throw _privateConstructorUsedError;
  String? get image => throw _privateConstructorUsedError;
  bool get isFavorite => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $RecipeCopyWith<Recipe> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RecipeCopyWith<$Res> {
  factory $RecipeCopyWith(Recipe value, $Res Function(Recipe) then) =
      _$RecipeCopyWithImpl<$Res>;
  $Res call(
      {int i,
      String name,
      int time,
      double calories,
      List<Ingredient> ingredients,
      List<String> steps,
      String? level,
      String? image,
      bool isFavorite});
}

/// @nodoc
class _$RecipeCopyWithImpl<$Res> implements $RecipeCopyWith<$Res> {
  _$RecipeCopyWithImpl(this._value, this._then);

  final Recipe _value;
  // ignore: unused_field
  final $Res Function(Recipe) _then;

  @override
  $Res call({
    Object? i = freezed,
    Object? name = freezed,
    Object? time = freezed,
    Object? calories = freezed,
    Object? ingredients = freezed,
    Object? steps = freezed,
    Object? level = freezed,
    Object? image = freezed,
    Object? isFavorite = freezed,
  }) {
    return _then(_value.copyWith(
      i: i == freezed
          ? _value.i
          : i // ignore: cast_nullable_to_non_nullable
              as int,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      time: time == freezed
          ? _value.time
          : time // ignore: cast_nullable_to_non_nullable
              as int,
      calories: calories == freezed
          ? _value.calories
          : calories // ignore: cast_nullable_to_non_nullable
              as double,
      ingredients: ingredients == freezed
          ? _value.ingredients
          : ingredients // ignore: cast_nullable_to_non_nullable
              as List<Ingredient>,
      steps: steps == freezed
          ? _value.steps
          : steps // ignore: cast_nullable_to_non_nullable
              as List<String>,
      level: level == freezed
          ? _value.level
          : level // ignore: cast_nullable_to_non_nullable
              as String?,
      image: image == freezed
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String?,
      isFavorite: isFavorite == freezed
          ? _value.isFavorite
          : isFavorite // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
abstract class _$RecipeCopyWith<$Res> implements $RecipeCopyWith<$Res> {
  factory _$RecipeCopyWith(_Recipe value, $Res Function(_Recipe) then) =
      __$RecipeCopyWithImpl<$Res>;
  @override
  $Res call(
      {int i,
      String name,
      int time,
      double calories,
      List<Ingredient> ingredients,
      List<String> steps,
      String? level,
      String? image,
      bool isFavorite});
}

/// @nodoc
class __$RecipeCopyWithImpl<$Res> extends _$RecipeCopyWithImpl<$Res>
    implements _$RecipeCopyWith<$Res> {
  __$RecipeCopyWithImpl(_Recipe _value, $Res Function(_Recipe) _then)
      : super(_value, (v) => _then(v as _Recipe));

  @override
  _Recipe get _value => super._value as _Recipe;

  @override
  $Res call({
    Object? i = freezed,
    Object? name = freezed,
    Object? time = freezed,
    Object? calories = freezed,
    Object? ingredients = freezed,
    Object? steps = freezed,
    Object? level = freezed,
    Object? image = freezed,
    Object? isFavorite = freezed,
  }) {
    return _then(_Recipe(
      i: i == freezed
          ? _value.i
          : i // ignore: cast_nullable_to_non_nullable
              as int,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      time: time == freezed
          ? _value.time
          : time // ignore: cast_nullable_to_non_nullable
              as int,
      calories: calories == freezed
          ? _value.calories
          : calories // ignore: cast_nullable_to_non_nullable
              as double,
      ingredients: ingredients == freezed
          ? _value.ingredients
          : ingredients // ignore: cast_nullable_to_non_nullable
              as List<Ingredient>,
      steps: steps == freezed
          ? _value.steps
          : steps // ignore: cast_nullable_to_non_nullable
              as List<String>,
      level: level == freezed
          ? _value.level
          : level // ignore: cast_nullable_to_non_nullable
              as String?,
      image: image == freezed
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String?,
      isFavorite: isFavorite == freezed
          ? _value.isFavorite
          : isFavorite // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Recipe implements _Recipe {
  const _$_Recipe(
      {required this.i,
      required this.name,
      required this.time,
      required this.calories,
      required this.ingredients,
      required this.steps,
      this.level,
      this.image,
      this.isFavorite = false});

  factory _$_Recipe.fromJson(Map<String, dynamic> json) =>
      _$$_RecipeFromJson(json);

  @override
  final int i;
  @override
  final String name;
  @override
  final int time;
  @override
  final double calories;
  @override
  final List<Ingredient> ingredients;
  @override
  final List<String> steps;
  @override
  final String? level;
  @override
  final String? image;
  @JsonKey(defaultValue: false)
  @override
  final bool isFavorite;

  @override
  String toString() {
    return 'Recipe(i: $i, name: $name, time: $time, calories: $calories, ingredients: $ingredients, steps: $steps, level: $level, image: $image, isFavorite: $isFavorite)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Recipe &&
            (identical(other.i, i) || other.i == i) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.time, time) || other.time == time) &&
            (identical(other.calories, calories) ||
                other.calories == calories) &&
            const DeepCollectionEquality()
                .equals(other.ingredients, ingredients) &&
            const DeepCollectionEquality().equals(other.steps, steps) &&
            (identical(other.level, level) || other.level == level) &&
            (identical(other.image, image) || other.image == image) &&
            (identical(other.isFavorite, isFavorite) ||
                other.isFavorite == isFavorite));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      i,
      name,
      time,
      calories,
      const DeepCollectionEquality().hash(ingredients),
      const DeepCollectionEquality().hash(steps),
      level,
      image,
      isFavorite);

  @JsonKey(ignore: true)
  @override
  _$RecipeCopyWith<_Recipe> get copyWith =>
      __$RecipeCopyWithImpl<_Recipe>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_RecipeToJson(this);
  }
}

abstract class _Recipe implements Recipe {
  const factory _Recipe(
      {required int i,
      required String name,
      required int time,
      required double calories,
      required List<Ingredient> ingredients,
      required List<String> steps,
      String? level,
      String? image,
      bool isFavorite}) = _$_Recipe;

  factory _Recipe.fromJson(Map<String, dynamic> json) = _$_Recipe.fromJson;

  @override
  int get i;
  @override
  String get name;
  @override
  int get time;
  @override
  double get calories;
  @override
  List<Ingredient> get ingredients;
  @override
  List<String> get steps;
  @override
  String? get level;
  @override
  String? get image;
  @override
  bool get isFavorite;
  @override
  @JsonKey(ignore: true)
  _$RecipeCopyWith<_Recipe> get copyWith => throw _privateConstructorUsedError;
}
