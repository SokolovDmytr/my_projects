// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'token.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;
Token _$TokenFromJson(Map<String, dynamic> json) {
  return _Token.fromJson(json);
}

/// @nodoc
class _$TokenTearOff {
  const _$TokenTearOff();

// ignore: unused_element
  _Token call(
      {String token,
      String refreshToken,
      String ttlToken,
      DateTime createDate}) {
    return _Token(
      token: token,
      refreshToken: refreshToken,
      ttlToken: ttlToken,
      createDate: createDate,
    );
  }

// ignore: unused_element
  Token fromJson(Map<String, Object> json) {
    return Token.fromJson(json);
  }
}

/// @nodoc
// ignore: unused_element
const $Token = _$TokenTearOff();

/// @nodoc
mixin _$Token {
  String get token;
  String get refreshToken;
  String get ttlToken;
  DateTime get createDate;

  Map<String, dynamic> toJson();
  @JsonKey(ignore: true)
  $TokenCopyWith<Token> get copyWith;
}

/// @nodoc
abstract class $TokenCopyWith<$Res> {
  factory $TokenCopyWith(Token value, $Res Function(Token) then) =
      _$TokenCopyWithImpl<$Res>;
  $Res call(
      {String token,
      String refreshToken,
      String ttlToken,
      DateTime createDate});
}

/// @nodoc
class _$TokenCopyWithImpl<$Res> implements $TokenCopyWith<$Res> {
  _$TokenCopyWithImpl(this._value, this._then);

  final Token _value;
  // ignore: unused_field
  final $Res Function(Token) _then;

  @override
  $Res call({
    Object token = freezed,
    Object refreshToken = freezed,
    Object ttlToken = freezed,
    Object createDate = freezed,
  }) {
    return _then(_value.copyWith(
      token: token == freezed ? _value.token : token as String,
      refreshToken: refreshToken == freezed
          ? _value.refreshToken
          : refreshToken as String,
      ttlToken: ttlToken == freezed ? _value.ttlToken : ttlToken as String,
      createDate:
          createDate == freezed ? _value.createDate : createDate as DateTime,
    ));
  }
}

/// @nodoc
abstract class _$TokenCopyWith<$Res> implements $TokenCopyWith<$Res> {
  factory _$TokenCopyWith(_Token value, $Res Function(_Token) then) =
      __$TokenCopyWithImpl<$Res>;
  @override
  $Res call(
      {String token,
      String refreshToken,
      String ttlToken,
      DateTime createDate});
}

/// @nodoc
class __$TokenCopyWithImpl<$Res> extends _$TokenCopyWithImpl<$Res>
    implements _$TokenCopyWith<$Res> {
  __$TokenCopyWithImpl(_Token _value, $Res Function(_Token) _then)
      : super(_value, (v) => _then(v as _Token));

  @override
  _Token get _value => super._value as _Token;

  @override
  $Res call({
    Object token = freezed,
    Object refreshToken = freezed,
    Object ttlToken = freezed,
    Object createDate = freezed,
  }) {
    return _then(_Token(
      token: token == freezed ? _value.token : token as String,
      refreshToken: refreshToken == freezed
          ? _value.refreshToken
          : refreshToken as String,
      ttlToken: ttlToken == freezed ? _value.ttlToken : ttlToken as String,
      createDate:
          createDate == freezed ? _value.createDate : createDate as DateTime,
    ));
  }
}

@JsonSerializable()

/// @nodoc
class _$_Token implements _Token {
  const _$_Token(
      {this.token, this.refreshToken, this.ttlToken, this.createDate});

  factory _$_Token.fromJson(Map<String, dynamic> json) =>
      _$_$_TokenFromJson(json);

  @override
  final String token;
  @override
  final String refreshToken;
  @override
  final String ttlToken;
  @override
  final DateTime createDate;

  @override
  String toString() {
    return 'Token(token: $token, refreshToken: $refreshToken, ttlToken: $ttlToken, createDate: $createDate)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _Token &&
            (identical(other.token, token) ||
                const DeepCollectionEquality().equals(other.token, token)) &&
            (identical(other.refreshToken, refreshToken) ||
                const DeepCollectionEquality()
                    .equals(other.refreshToken, refreshToken)) &&
            (identical(other.ttlToken, ttlToken) ||
                const DeepCollectionEquality()
                    .equals(other.ttlToken, ttlToken)) &&
            (identical(other.createDate, createDate) ||
                const DeepCollectionEquality()
                    .equals(other.createDate, createDate)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(token) ^
      const DeepCollectionEquality().hash(refreshToken) ^
      const DeepCollectionEquality().hash(ttlToken) ^
      const DeepCollectionEquality().hash(createDate);

  @JsonKey(ignore: true)
  @override
  _$TokenCopyWith<_Token> get copyWith =>
      __$TokenCopyWithImpl<_Token>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_TokenToJson(this);
  }
}

abstract class _Token implements Token {
  const factory _Token(
      {String token,
      String refreshToken,
      String ttlToken,
      DateTime createDate}) = _$_Token;

  factory _Token.fromJson(Map<String, dynamic> json) = _$_Token.fromJson;

  @override
  String get token;
  @override
  String get refreshToken;
  @override
  String get ttlToken;
  @override
  DateTime get createDate;
  @override
  @JsonKey(ignore: true)
  _$TokenCopyWith<_Token> get copyWith;
}
