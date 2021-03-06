import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fridge_yellow_team_bloc/application/bloc/ingridients_bloc/ingredients_bloc.dart';
import 'package:fridge_yellow_team_bloc/application/bloc/ingridients_bloc/ingredients_event.dart';
import 'package:fridge_yellow_team_bloc/application/bloc/recipes_bloc/recipes_bloc.dart';
import 'package:fridge_yellow_team_bloc/application/bloc/recipes_bloc/recipes_event.dart';
import 'package:fridge_yellow_team_bloc/application/cubit/application_token_cubit.dart';
import 'package:fridge_yellow_team_bloc/dictionary/dictionary_classes/dialog_language.dart';
import 'package:fridge_yellow_team_bloc/dictionary/flutter_dictionary.dart';
import 'package:fridge_yellow_team_bloc/models/exception/no_internet_connection_exception.dart';
import 'package:fridge_yellow_team_bloc/models/exception/server_error_exception.dart';
import 'package:fridge_yellow_team_bloc/repositories/repositories_interface/i_auth_repository.dart';
import 'package:fridge_yellow_team_bloc/res/const.dart';
import 'package:fridge_yellow_team_bloc/services/dialog_service/dialog_service.dart';
import 'package:fridge_yellow_team_bloc/services/dialog_service/dialogs/error_dialog/error_dialog.dart';
import 'package:fridge_yellow_team_bloc/services/dialog_service/dialogs/error_dialog/error_dialog_widget.dart';
import 'package:fridge_yellow_team_bloc/services/dialog_service/dialogs/loader/loader_pop_up.dart';
import 'package:fridge_yellow_team_bloc/services/dialog_service/dialogs/loader/loader_widget.dart';
import 'package:fridge_yellow_team_bloc/services/network_service/models/base_http_response.dart';
import 'package:fridge_yellow_team_bloc/services/network_service/network_service.dart';
import 'package:fridge_yellow_team_bloc/services/pop_up_service/pop_up_service.dart';
import 'package:fridge_yellow_team_bloc/services/pop_up_service/server_error_pop_up_widget.dart';
import 'package:fridge_yellow_team_bloc/services/route_service/route_selectors.dart';
import 'package:fridge_yellow_team_bloc/services/route_service/route_service.dart';
import 'package:fridge_yellow_team_bloc/services/user_information_service/user_information_service.dart';
import 'package:fridge_yellow_team_bloc/ui/pages/settings_page/cubit/settings_page_state.dart';

class SettingsPageCubit extends Cubit<SettingsPageState> {
  IAuthRepository repository;

  SettingsPageCubit({
    required this.repository,
  }) : super(SettingsPageState());

  Future<void> logOut() async {
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

      final BaseHttpResponse response = await repository.logOut(
        token: RouteService.instance.navigatorKey.currentContext!.read<ApplicationTokenCubit>().state.token!.token,
      );
      if (response.response == null) {
        throw ServerError();
      } else {
        UserInformationService.instance.clear();
        DialogService.instance.close();
        RouteService.instance.navigatorKey.currentState!.context.read<ApplicationTokenCubit>().clearToken();
        RouteService.instance.navigatorKey.currentState!.context.read<IngredientsBloc>().add(
              ClearIngredientsEvent(),
            );
        RouteService.instance.navigatorKey.currentState!.context.read<RecipesBloc>().add(
              ClearAllListRecipesEvent(),
            );
        RouteSelectors.goToAuthPage().call();
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
    }
  }
}
