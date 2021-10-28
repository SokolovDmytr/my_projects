import 'package:fridge_yellow_team_bloc/services/network_service/models/base_http_response.dart';
import 'package:fridge_yellow_team_bloc/services/network_service/network_service.dart';
import 'package:fridge_yellow_team_bloc/services/network_service/res/consts.dart';
import 'package:fridge_yellow_team_bloc/services/network_service/res/request_params/accept_code_params.dart';
import 'package:fridge_yellow_team_bloc/services/network_service/res/request_params/change_password_params.dart';
import 'package:fridge_yellow_team_bloc/services/network_service/res/request_params/login_google_params.dart';
import 'package:fridge_yellow_team_bloc/services/network_service/res/request_params/login_params.dart';
import 'package:fridge_yellow_team_bloc/services/network_service/res/request_params/logout_params.dart';
import 'package:fridge_yellow_team_bloc/services/network_service/res/request_params/recover_params.dart';
import 'package:fridge_yellow_team_bloc/services/network_service/res/request_params/registration_google_params.dart';
import 'package:fridge_yellow_team_bloc/services/network_service/res/request_params/registration_params.dart';

class AuthRepository {
  static final AuthRepository _instance = AuthRepository._();

  static AuthRepository get instance => _instance;

  AuthRepository._();

  Future<BaseHttpResponse> register({
    required String email,
    required String firstName,
    required String password,
  }) async {
    NetworkService.instance.init(baseUrl: baseUrl);

    return await NetworkService.instance.requestWithParams(
      type: HttpType.httpGet,
      route: HttpRoute.registration,
      parameter: RegistrationParams(
        email: email,
        firstName: firstName,
        password: password,
      ),
    );
  }

  Future<BaseHttpResponse> logIn({
    required String email,
    required String password,
  }) async {
    NetworkService.instance.init(baseUrl: baseUrl);

    return await NetworkService.instance.requestWithParams(
      type: HttpType.httpGet,
      route: HttpRoute.login,
      parameter: LoginParams(
        email: email,
        password: password,
      ),
    );
  }

  Future<BaseHttpResponse> logOut({
    required String token,
  }) async {
    NetworkService.instance.init(baseUrl: baseUrl);

    return await NetworkService.instance.requestWithParams(
      type: HttpType.httpPost,
      route: HttpRoute.logout,
      parameter: LogOutParams(
        token: token,
      ),
    );
  }

  Future<BaseHttpResponse> signInWithGoogle({
    required String email,
    required String googleToken,
  }) async {
    NetworkService.instance.init(baseUrl: baseUrl);

    return await NetworkService.instance.requestWithParams(
      type: HttpType.httpGet,
      route: HttpRoute.loginWithGoogle,
      parameter: LoginGoogleParams(
        email: email,
        googleToken: googleToken,
      ),
    );
  }

  Future<BaseHttpResponse> registerWithGoogle({
    required String email,
    required String googleToken,
  }) async {
    NetworkService.instance.init(baseUrl: baseUrl);

    return await NetworkService.instance.requestWithParams(
      type: HttpType.httpGet,
      route: HttpRoute.registerWithGoogle,
      parameter: RegistrationGoogleParams(
        email: email,
        googleToken: googleToken,
      ),
    );
  }

  Future<BaseHttpResponse> sendEmail({
    required String email,
  }) async {
    NetworkService.instance.init(baseUrl: baseUrl);

    return await NetworkService.instance.requestWithParams(
      type: HttpType.httpGet,
      route: HttpRoute.recover,
      parameter: RecoverParams(
        email: email,
      ),
    );
  }

  Future<BaseHttpResponse> sendCode({
    required String email,
    required String code,
  }) async {
    NetworkService.instance.init(baseUrl: baseUrl);

    return await NetworkService.instance.requestWithParams(
      type: HttpType.httpPost,
      route: HttpRoute.acceptCode,
      parameter: AcceptCodeParams(
        email: email,
        code: code,
      ),
    );
  }

  Future<BaseHttpResponse> saveNewPassword({
    required String email,
    required String password,
  }) async {
    NetworkService.instance.init(baseUrl: baseUrl);

    return await NetworkService.instance.requestWithParams(
      type: HttpType.httpGet,
      route: HttpRoute.acceptCode,
      parameter: ChangePasswordParams(
        email: email,
        password: password,
      ),
    );
  }
}
