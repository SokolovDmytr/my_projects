// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'ingredient.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;
Ingredient _$IngredientFromJson(Map<String, dynamic> json) {
  return _Ingredient.fromJson(json);
}

/// @nodoc
class _$IngredientTearOff {
  const _$IngredientTearOff();

// ignore: unused_element
  _Ingredient call(
      {String i = emptyString,
      int id = 0,
      String count = emptyString,
      dynamic description = emptyString,
      dynamic name = emptyString,
      dynamic image = emptyString}) {
    return _Ingredient(
      i: i,
      id: id,
      count: count,
      description: description,
      name: name,
      image: image,
    );
  }

// ignore: unused_element
  Ingredient fromJson(Map<String, Object> json) {
    return Ingredient.fromJson(json);
  }
}

/// @nodoc
// ignore: unused_element
const $Ingredient = _$IngredientTearOff();

/// @nodoc
mixin _$Ingredient {
  String get i;
  int get id;
  String get count;
  dynamic get description;
  dynamic get name;
  dynamic get image;

  Map<String, dynamic> toJson();
  @JsonKey(ignore: true)
  $IngredientCopyWith<Ingredient> get copyWith;
}

/// @nodoc
abstract class $IngredientCopyWith<$Res> {
  factory $IngredientCopyWith(
          Ingredient value, $Res Function(Ingredient) then) =
      _$IngredientCopyWithImpl<$Res>;
  $Res call(
      {String i,
      int id,
      String count,
      dynamic description,
      dynamic name,
      dynamic image});
}

/// @nodoc
class _$IngredientCopyWithImpl<$Res> implements $IngredientCopyWith<$Res> {
  _$IngredientCopyWithImpl(this._value, this._then);

  final Ingredient _value;
  // ignore: unused_field
  final $Res Function(Ingredient) _then;

  @override
  $Res call({
    Object i = freezed,
    Object id = freezed,
    Object count = freezed,
    Object description = freezed,
    Object name = freezed,
    Object image = freezed,
  }) {
    return _then(_value.copyWith(
      i: i == freezed ? _value.i : i as String,
      id: id == freezed ? _value.id : id as int,
      count: count == freezed ? _value.count : count as String,
      description:
          description == freezed ? _value.description : description as dynamic,
      name: name == freezed ? _value.name : name as dynamic,
      image: image == freezed ? _value.image : image as dynamic,
    ));
  }
}

/// @nodoc
abstract class _$IngredientCopyWith<$Res> implements $IngredientCopyWith<$Res> {
  factory _$IngredientCopyWith(
          _Ingredient value, $Res Function(_Ingredient) then) =
      __$IngredientCopyWithImpl<$Res>;
  @override
  $Res call(
      {String i,
      int id,
      String count,
      dynamic description,
      dynamic name,
      dynamic image});
}

/// @nodoc
class __$IngredientCopyWithImpl<$Res> extends _$IngredientCopyWithImpl<$Res>
    implements _$IngredientCopyWith<$Res> {
  __$IngredientCopyWithImpl(
      _Ingredient _value, $Res Function(_Ingredient) _then)
      : super(_value, (v) => _then(v as _Ingredient));

  @override
  _Ingredient get _value => super._value as _Ingredient;

  @override
  $Res call({
    Object i = freezed,
    Object id = freezed,
    Object count = freezed,
    Object description = freezed,
    Object name = freezed,
    Object image = freezed,
  }) {
    return _then(_Ingredient(
      i: i == freezed ? _value.i : i as String,
      id: id == freezed ? _value.id : id as int,
      count: count == freezed ? _value.count : count as String,
      description: description == freezed ? _value.description : description,
      name: name == freezed ? _value.name : name,
      image: image == freezed ? _value.image : image,
    ));
  }
}

@JsonSerializable()

/// @nodoc
class _$_Ingredient implements _Ingredient {
  const _$_Ingredient(
      {this.i = emptyString,
      this.id = 0,
      this.count = emptyString,
      this.description = emptyString,
      this.name = emptyString,
      this.image = emptyString})
      : assert(i != null),
        assert(id != null),
        assert(count != null),
        assert(description != null),
        assert(name != null),
        assert(image != null);

  factory _$_Ingredient.fromJson(Map<String, dynamic> json) =>
      _$_$_IngredientFromJson(json);

  @JsonKey(defaultValue: emptyString)
  @override
  final String i;
  @JsonKey(defaultValue: 0)
  @override
  final int id;
  @JsonKey(defaultValue: emptyString)
  @override
  final String count;
  @JsonKey(defaultValue: emptyString)
  @override
  final dynamic description;
  @JsonKey(defaultValue: emptyString)
  @override
  final dynamic name;
  @JsonKey(defaultValue: emptyString)
  @override
  final dynamic image;

  @override
  String toString() {
    return 'Ingredient(i: $i, id: $id, count: $count, description: $description, name: $name, image: $image)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _Ingredient &&
            (identical(other.i, i) ||
                const DeepCollectionEquality().equals(other.i, i)) &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.count, count) ||
                const DeepCollectionEquality().equals(other.count, count)) &&
            (identical(other.description, description) ||
                const DeepCollectionEquality()
                    .equals(other.description, description)) &&
            (identical(other.name, name) ||
                const DeepCollectionEquality().equals(other.name, name)) &&
            (identical(other.image, image) ||
                const DeepCollectionEquality().equals(other.image, image)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(i) ^
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(count) ^
      const DeepCollectionEquality().hash(description) ^
      const DeepCollectionEquality().hash(name) ^
      const DeepCollectionEquality().hash(image);

  @JsonKey(ignore: true)
  @override
  _$IngredientCopyWith<_Ingredient> get copyWith =>
      __$IngredientCopyWithImpl<_Ingredient>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_IngredientToJson(this);
  }
}

abstract class _Ingredient implements Ingredient {
  const factory _Ingredient(
      {String i,
      int id,
      String count,
      dynamic description,
      dynamic name,
      dynamic image}) = _$_Ingredient;

  factory _Ingredient.fromJson(Map<String, dynamic> json) =
      _$_Ingredient.fromJson;

  @override
  String get i;
  @override
  int get id;
  @override
  String get count;
  @override
  dynamic get description;
  @override
  dynamic get name;
  @override
  dynamic get image;
  @override
  @JsonKey(ignore: true)
  _$IngredientCopyWith<_Ingredient> get copyWith;
}
