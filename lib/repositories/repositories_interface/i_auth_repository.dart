import 'package:fridge_yellow_team_bloc/services/network_service/models/base_http_response.dart';

abstract class IAuthRepository {
  Future<BaseHttpResponse> register({
    required String email,
    required String firstName,
    required String password,
  });

  Future<BaseHttpResponse> logIn({
    required String email,
    required String password,
  });

  Future<BaseHttpResponse> logOut({
    required String token,
  });

  Future<BaseHttpResponse> signInWithGoogle({
    required String email,
    required String googleToken,
  });

  Future<BaseHttpResponse> registerWithGoogle({
    required String email,
    required String googleToken,
  });

  Future<BaseHttpResponse> sendEmail({
    required String email,
  });

  Future<BaseHttpResponse> sendCode({
    required String email,
    required String code,
  });

  Future<BaseHttpResponse> saveNewPassword({
    required String email,
    required String password,
  });

  Future<BaseHttpResponse> updateToken({
    required String refreshToken,
  });
}
