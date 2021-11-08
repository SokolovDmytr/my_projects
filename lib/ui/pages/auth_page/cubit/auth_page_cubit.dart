import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fridge_yellow_team_bloc/application/cubit/application_token_cubit.dart';
import 'package:fridge_yellow_team_bloc/dictionary/dictionary_classes/dialog_language.dart';
import 'package:fridge_yellow_team_bloc/dictionary/flutter_dictionary.dart';
import 'package:fridge_yellow_team_bloc/models/exception/no_internet_connection_exception.dart';
import 'package:fridge_yellow_team_bloc/models/exception/server_error_exception.dart';
import 'package:fridge_yellow_team_bloc/models/pages/freezed/token.dart';
import 'package:fridge_yellow_team_bloc/repositories/repositories_interface/i_auth_repository.dart';
import 'package:fridge_yellow_team_bloc/res/const.dart';
import 'package:fridge_yellow_team_bloc/services/dialog_service/dialog_service.dart';
import 'package:fridge_yellow_team_bloc/services/dialog_service/dialogs/error_dialog/error_dialog.dart';
import 'package:fridge_yellow_team_bloc/services/dialog_service/dialogs/error_dialog/error_dialog_widget.dart';
import 'package:fridge_yellow_team_bloc/services/dialog_service/dialogs/forgot_password_dialog/enter_code_dialog_widget.dart';
import 'package:fridge_yellow_team_bloc/services/dialog_service/dialogs/forgot_password_dialog/forgot_password_dialog.dart';
import 'package:fridge_yellow_team_bloc/services/dialog_service/dialogs/loader/loader_pop_up.dart';
import 'package:fridge_yellow_team_bloc/services/dialog_service/dialogs/loader/loader_widget.dart';
import 'package:fridge_yellow_team_bloc/services/network_service/models/base_http_response.dart';
import 'package:fridge_yellow_team_bloc/services/network_service/network_service.dart';
import 'package:fridge_yellow_team_bloc/services/network_service/res/consts.dart';
import 'package:fridge_yellow_team_bloc/services/network_service/shared/fridge_parser.dart';
import 'package:fridge_yellow_team_bloc/services/pop_up_service/pop_up_service.dart';
import 'package:fridge_yellow_team_bloc/services/pop_up_service/server_error_pop_up_widget.dart';
import 'package:fridge_yellow_team_bloc/services/route_service/route_selectors.dart';
import 'package:fridge_yellow_team_bloc/services/route_service/route_service.dart';
import 'package:fridge_yellow_team_bloc/services/user_information_service/user_information_service.dart';
import 'package:fridge_yellow_team_bloc/ui/pages/auth_page/cubit/auth_page_state.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthPageCubit extends Cubit<AuthPageState> {
  final IAuthRepository repository;

  AuthPageCubit({
    required this.repository,
  }) : super(AuthPageState.init());

  Future<void> logIn(String email, String password) async {
    final DialogLanguage language = FlutterDictionary.instance.language.dialogLanguage;
    DialogService.instance.show(
      dialog: LoaderPopUp(
        title: language.loadingText,
        state: true,
        loaderKey: LoaderKey.getData,
        child: LoaderWidget(),
      ),
    );

    try {
      final bool isConnection = await NetworkService.instance.checkInternetConnection();

      if (isConnection == false) {
        throw NoInternetConnectionException();
      }

      final BaseHttpResponse response = await repository.logIn(
        email: email,
        password: password,
      );

      if (response.response == null) {
        throw ServerError();
      } else {
        final Token token = FridgeParser.instance.parseEntity(
          exampleObject: Token,
          response: response,
        );
        RouteService.instance.navigatorKey.currentState!.context.read<ApplicationTokenCubit>().saveToken(token);
        UserInformationService.instance.saveInformation(token);

        DialogService.instance.close();
        UserInformationService.instance.isFirstVisitApp() ? RouteSelectors.goToOnBoardingPage().call() : RouteSelectors.goToHomePage().call();
      }
    } on NoInternetConnectionException {
      DialogService.instance.close();

      DialogService.instance.show(
        dialog: ErrorDialog(
          child: ErrorDialogWidget(),
        ),
      );
      return;
    } on ServerError {
      DialogService.instance.close();

      PopUpService.instance.show(
        widget: ServerErrorPopUpWidget(),
      );
      return;
    }
  }

  Future<void> register(String email, String firstName, String password) async {
    final DialogLanguage language = FlutterDictionary.instance.language.dialogLanguage;
    DialogService.instance.show(
      dialog: LoaderPopUp(
        title: language.loadingText,
        state: true,
        loaderKey: LoaderKey.getData,
        child: LoaderWidget(),
      ),
    );

    try {
      final bool isConnection = await NetworkService.instance.checkInternetConnection();

      if (isConnection == false) {
        throw NoInternetConnectionException();
      }

      final BaseHttpResponse response = await repository.register(
        email: email,
        firstName: firstName,
        password: password,
      );

      if (response.response == null) {
        throw ServerError();
      } else {
        final Token token = FridgeParser.instance.parseEntity(
          exampleObject: Token,
          response: response,
        );
        RouteService.instance.navigatorKey.currentState!.context.read<ApplicationTokenCubit>().saveToken(token);
        UserInformationService.instance.saveInformation(token);

        DialogService.instance.close();
        UserInformationService.instance.isFirstVisitApp() ? RouteSelectors.goToOnBoardingPage().call() : RouteSelectors.goToHomePage().call();
      }
    } on NoInternetConnectionException {
      DialogService.instance.close();

      DialogService.instance.show(
        dialog: ErrorDialog(
          child: ErrorDialogWidget(),
        ),
      );
      return;
    } on ServerError {
      DialogService.instance.close();

      PopUpService.instance.show(
        widget: ServerErrorPopUpWidget(),
      );
      return;
    }
  }

  Future<void> signInWithGoogle() async {
    final DialogLanguage language = FlutterDictionary.instance.language.dialogLanguage;

    DialogService.instance.show(
      dialog: LoaderPopUp(
        title: language.loadingText,
        state: true,
        loaderKey: LoaderKey.getData,
        child: LoaderWidget(),
      ),
    );

    try {
      final bool isConnection = await NetworkService.instance.checkInternetConnection();

      if (isConnection == false) {
        throw NoInternetConnectionException();
      }

      final GoogleSignIn _googleSignIn = GoogleSignIn(
        scopes: [
          googleAccountEmail,
          googleLink,
        ],
      );

      final GoogleSignInAccount? googleSignInAccount = await _googleSignIn.signIn();
      if (googleSignInAccount != null) {
        final GoogleSignInAuthentication googleSignInAuthentication = await googleSignInAccount.authentication;

        if (googleSignInAuthentication.accessToken != null) {
          final BaseHttpResponse response = await repository.signInWithGoogle(
            email: googleSignInAccount.email,
            googleToken: googleSignInAuthentication.accessToken!,
          );

          if (response.response == null) {
            throw ServerError();
          } else {
            final Token token = FridgeParser.instance.parseEntity(
              exampleObject: Token,
              response: response,
            );

            RouteService.instance.navigatorKey.currentState!.context.read<ApplicationTokenCubit>().saveToken(token);
            UserInformationService.instance.saveInformation(token);

            DialogService.instance.close();

            UserInformationService.instance.isFirstVisitApp() ? RouteSelectors.goToOnBoardingPage().call() : RouteSelectors.goToHomePage().call();
            DialogService.instance.close();
          }
        }
      }
    } on NoInternetConnectionException {
      DialogService.instance.close();

      DialogService.instance.show(
        dialog: ErrorDialog(
          child: ErrorDialogWidget(),
        ),
      );
      return;
    } on ServerError {
      DialogService.instance.close();

      PopUpService.instance.show(
        widget: ServerErrorPopUpWidget(),
      );
      return;
    } catch (error) {
      DialogService.instance.close();
      logger.e(error);
    }
  }

  Future<void> registerWithGoogle() async {
    final DialogLanguage language = FlutterDictionary.instance.language.dialogLanguage;

    DialogService.instance.show(
      dialog: LoaderPopUp(
        title: language.loadingText,
        state: true,
        loaderKey: LoaderKey.getData,
        child: LoaderWidget(),
      ),
    );

    try {
      final bool isConnection = await NetworkService.instance.checkInternetConnection();

      if (isConnection == false) {
        throw NoInternetConnectionException();
      }

      final GoogleSignIn _googleSignIn = GoogleSignIn(
        scopes: [
          googleAccountEmail,
          googleLink,
        ],
      );

      final GoogleSignInAccount? googleSignInAccount = await _googleSignIn.signIn();

      if (googleSignInAccount != null) {
        final GoogleSignInAuthentication googleSignInAuthentication = await googleSignInAccount.authentication;

        if (googleSignInAuthentication.accessToken != null) {
          final BaseHttpResponse response = await repository.registerWithGoogle(
            email: googleSignInAccount.email,
            googleToken: googleSignInAuthentication.accessToken!,
          );

          if (response.response == null) {
            throw ServerError();
          } else {
            final Token token = FridgeParser.instance.parseEntity(
              exampleObject: Token,
              response: response,
            );

            RouteService.instance.navigatorKey.currentState!.context.read<ApplicationTokenCubit>().saveToken(token);
            UserInformationService.instance.saveInformation(token);

            DialogService.instance.close();

            UserInformationService.instance.isFirstVisitApp() ? RouteSelectors.goToOnBoardingPage().call() : RouteSelectors.goToHomePage().call();
            return;
          }
        }
      }

      DialogService.instance.close();

      PopUpService.instance.show(
        widget: ServerErrorPopUpWidget(),
      );
    } on NoInternetConnectionException {
      DialogService.instance.close();

      DialogService.instance.show(
        dialog: ErrorDialog(
          child: ErrorDialogWidget(),
        ),
      );
      return;
    } on ServerError {
      DialogService.instance.close();

      PopUpService.instance.show(
        widget: ServerErrorPopUpWidget(),
      );
    } catch (error) {
      DialogService.instance.close();
      logger.e(error);
    }
  }

  Future<void> sendEmail({required String email}) async {
    try {
      final bool isConnection = await NetworkService.instance.checkInternetConnection();
      if (isConnection == false) {
        throw NoInternetConnectionException();
      }

      final BaseHttpResponse response = await repository.sendEmail(email: email);
      if (response.response == null) {
        throw ServerError(message: response.error!.error);
      } else {
        DialogService.instance.close();

        DialogService.instance.show(
          dialog: ForgotPasswordDialog(
            child: EnterCodeDialogWidget(
              onTapSend: (String? code) {
                if (code != null) {
                  sendCode(code: code, email: email);
                }
              },
            ),
          ),
        );
      }
    } on NoInternetConnectionException {
      DialogService.instance.close();

      DialogService.instance.show(
        dialog: ErrorDialog(
          child: ErrorDialogWidget(),
        ),
      );
      return;
    } on ServerError catch (error) {
      DialogService.instance.close();

      PopUpService.instance.show(
        widget: ServerErrorPopUpWidget(
          text: error.message,
        ),
      );
    }
  }

  Future<void> sendCode({
    required String code,
    required String email,
  }) async {
    try {
      final bool isConnection = await NetworkService.instance.checkInternetConnection();

      if (isConnection == false) {
        throw NoInternetConnectionException();
      }

      final BaseHttpResponse response = await repository.sendCode(
        email: email,
        code: code,
      );

      if (response.response == null) {
        throw ServerError(message: response.error!.error);
      } else {
        DialogService.instance.close();

        DialogService.instance.show(
          dialog: ForgotPasswordDialog(
            child: EnterCodeDialogWidget(
              onTapSend: (String? password) {
                if (password != null) {
                  saveNewPassword(
                    email: email,
                    password: password,
                  );
                }
              },
            ),
          ),
        );
      }
    } on NoInternetConnectionException {
      DialogService.instance.close();

      DialogService.instance.show(
        dialog: ErrorDialog(
          child: ErrorDialogWidget(),
        ),
      );
      return;
    } on ServerError catch (error) {
      DialogService.instance.close();

      DialogService.instance.show(
        dialog: ErrorDialog(
          child: ErrorDialogWidget(
            text: error.message,
          ),
        ),
      );
    }
  }

  Future<void> saveNewPassword({
    required String email,
    required String password,
  }) async {
    try {
      final bool isConnection = await NetworkService.instance.checkInternetConnection();

      if (isConnection == false) {
        throw NoInternetConnectionException();
      }

      final BaseHttpResponse response = await repository.saveNewPassword(
        email: email,
        password: password,
      );

      DialogService.instance.close();
      if (response.response == null) {
        throw ServerError();
      }
    } on NoInternetConnectionException {
      DialogService.instance.close();

      DialogService.instance.show(
        dialog: ErrorDialog(
          child: ErrorDialogWidget(),
        ),
      );
      return;
    } on ServerError {
      PopUpService.instance.show(
        widget: ServerErrorPopUpWidget(),
      );
    }
  }
}
