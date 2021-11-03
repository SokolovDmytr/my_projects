// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'token.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Token _$$_TokenFromJson(Map<String, dynamic> json) => _$_Token(
      token: json['token'] == null ?  json['authToken'] as String : json['token'] as String,
      refreshToken: json['refreshToken'] as String,
      ttlToken: json['ttlToken'] as String,
      createDate: json['createDate'] == null
          ? DateTime.now().subtract(
              AppDuration.delayOfSendRequestToServer,
            )
          : DateTime.parse(
              json['createDate'] as String,
            ),
    );

Map<String, dynamic> _$$_TokenToJson(_$_Token instance) => <String, dynamic>{
      'token': instance.token,
      'refreshToken': instance.refreshToken,
      'ttlToken': instance.ttlToken,
      'createDate': instance.createDate.toIso8601String(),
    };
