import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fridge_yellow_team_bloc/application/cubit/application_token_cubit.dart';
import 'package:fridge_yellow_team_bloc/dictionary/data/en.dart';
import 'package:fridge_yellow_team_bloc/dictionary/dictionary_classes/dialog_language.dart';
import 'package:fridge_yellow_team_bloc/dictionary/flutter_dictionary.dart';
import 'package:fridge_yellow_team_bloc/models/pages/freezed/token.dart';
import 'package:fridge_yellow_team_bloc/repositories/auth_repository.dart';
import 'package:fridge_yellow_team_bloc/res/const.dart';
import 'package:fridge_yellow_team_bloc/services/dialog_service/dialog_service.dart';
import 'package:fridge_yellow_team_bloc/services/dialog_service/dialogs/error_dialog/error_dialog.dart';
import 'package:fridge_yellow_team_bloc/services/dialog_service/dialogs/error_dialog/error_dialog_widget.dart';
import 'package:fridge_yellow_team_bloc/services/dialog_service/dialogs/loader/loader_pop_up.dart';
import 'package:fridge_yellow_team_bloc/services/dialog_service/dialogs/loader/loader_widget.dart';
import 'package:fridge_yellow_team_bloc/services/network_service/models/base_http_response.dart';
import 'package:fridge_yellow_team_bloc/services/network_service/network_service.dart';
import 'package:fridge_yellow_team_bloc/services/network_service/shared/fridge_parser.dart';
import 'package:fridge_yellow_team_bloc/services/pop_up_service/pop_up_service.dart';
import 'package:fridge_yellow_team_bloc/services/pop_up_service/server_error_pop_up_widget.dart';
import 'package:fridge_yellow_team_bloc/services/route_service/route_selectors.dart';
import 'package:fridge_yellow_team_bloc/services/route_service/route_service.dart';
import 'package:fridge_yellow_team_bloc/services/user_information_service/user_information_service.dart';
import 'package:fridge_yellow_team_bloc/ui/pages/auth_page/cubit/auth_page_state.dart';

class AuthPageCubit extends Cubit<AuthPageState> {
  AuthPageCubit() : super(AuthPageState.init());

  Future<void> logIn(String email, String password) async {
    final DialogLanguage language = FlutterDictionary.instance.language?.dialogLanguage ?? en.dialogLanguage;
    DialogService.instance.show(
      dialog: LoaderPopUp(
        title: language.loadingText,
        state: true,
        loaderKey: LoaderKey.getData,
        child: LoaderWidget(),
      ),
    );

    final bool isConnection = await NetworkService.instance.checkInternetConnection();
    if (isConnection == false) {
      DialogService.instance.close(RouteService.instance.navigatorKey.currentContext!);
      DialogService.instance.show(
        dialog: ErrorDialog(
          child: ErrorDialogWidget(),
        ),
      );
      return;
    }

    final BaseHttpResponse response = await AuthRepository.instance.logIn(
      email: email,
      password: password,
    );
    if (response.error == null) {
      final Token token = FridgeParser.instance.parseEntity(
        exampleObject: Token,
        response: response,
      );
      RouteService.instance.navigatorKey.currentState!.context.read<ApplicationTokenCubit>().saveToken(token);
      UserInformationService.instance.saveInformation(token);

      DialogService.instance.close(RouteService.instance.navigatorKey.currentContext!);
      UserInformationService.instance.isFirstVisitApp() ? RouteSelectors.goToOnBoardingPage().call() : RouteSelectors.goToHomePage().call();
    } else {
      DialogService.instance.close(RouteService.instance.navigatorKey.currentContext!);
      PopUpService.instance.show(
        widget: ServerErrorPopUpWidget(),
      );
    }
  }

  Future<void> register(String email, String firstName, String password) async {
    final DialogLanguage language = FlutterDictionary.instance.language?.dialogLanguage ?? en.dialogLanguage;
    DialogService.instance.show(
      dialog: LoaderPopUp(
        title: language.loadingText,
        state: true,
        loaderKey: LoaderKey.getData,
        child: LoaderWidget(),
      ),
    );

    final bool isConnection = await NetworkService.instance.checkInternetConnection();

    if (isConnection == false) {
      DialogService.instance.close(RouteService.instance.navigatorKey.currentContext!);
      DialogService.instance.show(
        dialog: ErrorDialog(
          child: ErrorDialogWidget(),
        ),
      );
      return;
    }

    final BaseHttpResponse response = await AuthRepository.instance.register(
      email: email,
      firstName: firstName,
      password: password,
    );

    if (response.error == null) {
      final Token token = FridgeParser.instance.parseEntity(
        exampleObject: Token,
        response: response,
      );
      RouteService.instance.navigatorKey.currentState!.context.read<ApplicationTokenCubit>().saveToken(token);
      UserInformationService.instance.saveInformation(token);

      DialogService.instance.close(RouteService.instance.navigatorKey.currentContext!);
      UserInformationService.instance.isFirstVisitApp() ? RouteSelectors.goToOnBoardingPage().call() : RouteSelectors.goToHomePage().call();
    } else {
      DialogService.instance.close(RouteService.instance.navigatorKey.currentContext!);
      PopUpService.instance.show(
        widget: ServerErrorPopUpWidget(),
      );
    }
  }
}
