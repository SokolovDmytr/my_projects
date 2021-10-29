import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:fridge_yellow_team_bloc/res/app_duration.dart';

part 'token.freezed.dart';
part 'token.g.dart';

@freezed
class Token with _$Token {
  const factory Token({
    required String token,
    required String refreshToken,
    required String ttlToken,
    required DateTime createDate
  }) = _Token;

  factory Token.fromJson(Map<String, dynamic> json) => _$TokenFromJson(json);
}
