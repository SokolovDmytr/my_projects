// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'recipe.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;
Recipe _$RecipeFromJson(Map<String, dynamic> json) {
  return _Recipe.fromJson(json);
}

/// @nodoc
class _$RecipeTearOff {
  const _$RecipeTearOff();

// ignore: unused_element
  _Recipe call(
      {int i = -1,
      String name = emptyString,
      String image = emptyString,
      dynamic time = 0,
      double calories = 0.0,
      String level = emptyString,
      List<Ingredient> ingredients = const [],
      List<String> steps = const [],
      bool isFavorite = false}) {
    return _Recipe(
      i: i,
      name: name,
      image: image,
      time: time,
      calories: calories,
      level: level,
      ingredients: ingredients,
      steps: steps,
      isFavorite: isFavorite,
    );
  }

// ignore: unused_element
  Recipe fromJson(Map<String, Object> json) {
    return Recipe.fromJson(json);
  }
}

/// @nodoc
// ignore: unused_element
const $Recipe = _$RecipeTearOff();

/// @nodoc
mixin _$Recipe {
  int get i;
  String get name;
  String get image;
  dynamic get time;
  double get calories;
  String get level;
  List<Ingredient> get ingredients;
  List<String> get steps;
  bool get isFavorite;

  Map<String, dynamic> toJson();
  @JsonKey(ignore: true)
  $RecipeCopyWith<Recipe> get copyWith;
}

/// @nodoc
abstract class $RecipeCopyWith<$Res> {
  factory $RecipeCopyWith(Recipe value, $Res Function(Recipe) then) =
      _$RecipeCopyWithImpl<$Res>;
  $Res call(
      {int i,
      String name,
      String image,
      dynamic time,
      double calories,
      String level,
      List<Ingredient> ingredients,
      List<String> steps,
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
    Object i = freezed,
    Object name = freezed,
    Object image = freezed,
    Object time = freezed,
    Object calories = freezed,
    Object level = freezed,
    Object ingredients = freezed,
    Object steps = freezed,
    Object isFavorite = freezed,
  }) {
    return _then(_value.copyWith(
      i: i == freezed ? _value.i : i as int,
      name: name == freezed ? _value.name : name as String,
      image: image == freezed ? _value.image : image as String,
      time: time == freezed ? _value.time : time as dynamic,
      calories: calories == freezed ? _value.calories : calories as double,
      level: level == freezed ? _value.level : level as String,
      ingredients: ingredients == freezed
          ? _value.ingredients
          : ingredients as List<Ingredient>,
      steps: steps == freezed ? _value.steps : steps as List<String>,
      isFavorite:
          isFavorite == freezed ? _value.isFavorite : isFavorite as bool,
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
      String image,
      dynamic time,
      double calories,
      String level,
      List<Ingredient> ingredients,
      List<String> steps,
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
    Object i = freezed,
    Object name = freezed,
    Object image = freezed,
    Object time = freezed,
    Object calories = freezed,
    Object level = freezed,
    Object ingredients = freezed,
    Object steps = freezed,
    Object isFavorite = freezed,
  }) {
    return _then(_Recipe(
      i: i == freezed ? _value.i : i as int,
      name: name == freezed ? _value.name : name as String,
      image: image == freezed ? _value.image : image as String,
      time: time == freezed ? _value.time : time,
      calories: calories == freezed ? _value.calories : calories as double,
      level: level == freezed ? _value.level : level as String,
      ingredients: ingredients == freezed
          ? _value.ingredients
          : ingredients as List<Ingredient>,
      steps: steps == freezed ? _value.steps : steps as List<String>,
      isFavorite:
          isFavorite == freezed ? _value.isFavorite : isFavorite as bool,
    ));
  }
}

@JsonSerializable()

/// @nodoc
class _$_Recipe implements _Recipe {
  const _$_Recipe(
      {this.i = -1,
      this.name = emptyString,
      this.image = emptyString,
      this.time = 0,
      this.calories = 0.0,
      this.level = emptyString,
      this.ingredients = const [],
      this.steps = const [],
      this.isFavorite = false})
      : assert(i != null),
        assert(name != null),
        assert(image != null),
        assert(time != null),
        assert(calories != null),
        assert(level != null),
        assert(ingredients != null),
        assert(steps != null),
        assert(isFavorite != null);

  factory _$_Recipe.fromJson(Map<String, dynamic> json) =>
      _$_$_RecipeFromJson(json);

  @JsonKey(defaultValue: -1)
  @override
  final int i;
  @JsonKey(defaultValue: emptyString)
  @override
  final String name;
  @JsonKey(defaultValue: emptyString)
  @override
  final String image;
  @JsonKey(defaultValue: 0)
  @override
  final dynamic time;
  @JsonKey(defaultValue: 0.0)
  @override
  final double calories;
  @JsonKey(defaultValue: emptyString)
  @override
  final String level;
  @JsonKey(defaultValue: const [])
  @override
  final List<Ingredient> ingredients;
  @JsonKey(defaultValue: const [])
  @override
  final List<String> steps;
  @JsonKey(defaultValue: false)
  @override
  final bool isFavorite;

  @override
  String toString() {
    return 'Recipe(i: $i, name: $name, image: $image, time: $time, calories: $calories, level: $level, ingredients: $ingredients, steps: $steps, isFavorite: $isFavorite)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _Recipe &&
            (identical(other.i, i) ||
                const DeepCollectionEquality().equals(other.i, i)) &&
            (identical(other.name, name) ||
                const DeepCollectionEquality().equals(other.name, name)) &&
            (identical(other.image, image) ||
                const DeepCollectionEquality().equals(other.image, image)) &&
            (identical(other.time, time) ||
                const DeepCollectionEquality().equals(other.time, time)) &&
            (identical(other.calories, calories) ||
                const DeepCollectionEquality()
                    .equals(other.calories, calories)) &&
            (identical(other.level, level) ||
                const DeepCollectionEquality().equals(other.level, level)) &&
            (identical(other.ingredients, ingredients) ||
                const DeepCollectionEquality()
                    .equals(other.ingredients, ingredients)) &&
            (identical(other.steps, steps) ||
                const DeepCollectionEquality().equals(other.steps, steps)) &&
            (identical(other.isFavorite, isFavorite) ||
                const DeepCollectionEquality()
                    .equals(other.isFavorite, isFavorite)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(i) ^
      const DeepCollectionEquality().hash(name) ^
      const DeepCollectionEquality().hash(image) ^
      const DeepCollectionEquality().hash(time) ^
      const DeepCollectionEquality().hash(calories) ^
      const DeepCollectionEquality().hash(level) ^
      const DeepCollectionEquality().hash(ingredients) ^
      const DeepCollectionEquality().hash(steps) ^
      const DeepCollectionEquality().hash(isFavorite);

  @JsonKey(ignore: true)
  @override
  _$RecipeCopyWith<_Recipe> get copyWith =>
      __$RecipeCopyWithImpl<_Recipe>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_RecipeToJson(this);
  }
}

abstract class _Recipe implements Recipe {
  const factory _Recipe(
      {int i,
      String name,
      String image,
      dynamic time,
      double calories,
      String level,
      List<Ingredient> ingredients,
      List<String> steps,
      bool isFavorite}) = _$_Recipe;

  factory _Recipe.fromJson(Map<String, dynamic> json) = _$_Recipe.fromJson;

  @override
  int get i;
  @override
  String get name;
  @override
  String get image;
  @override
  dynamic get time;
  @override
  double get calories;
  @override
  String get level;
  @override
  List<Ingredient> get ingredients;
  @override
  List<String> get steps;
  @override
  bool get isFavorite;
  @override
  @JsonKey(ignore: true)
  _$RecipeCopyWith<_Recipe> get copyWith;
}
