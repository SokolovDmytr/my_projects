// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'token.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Token _$_$_TokenFromJson(Map<String, dynamic> json) {
  return _$_Token(
    token: json['token'] as String ?? json['authToken'] as String,
    refreshToken: json['refreshToken'] as String,
    ttlToken: json['ttlToken'] as String,
    createDate: json['createDate'] == null ? null : DateTime.parse(json['createDate'] as String),
  );
}

Map<String, dynamic> _$_$_TokenToJson(_$_Token instance) => <String, dynamic>{
      'token': instance.token,
      'refreshToken': instance.refreshToken,
      'ttlToken': instance.ttlToken,
      'createDate': instance.createDate?.toIso8601String(),
    };