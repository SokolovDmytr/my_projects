import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fridge_yellow_team_bloc/application/cubit/ingredients_state.dart';
import 'package:fridge_yellow_team_bloc/models/pages/freezed/ingredient.dart';
import 'package:fridge_yellow_team_bloc/repositories/ingredient_repository.dart';
import 'package:fridge_yellow_team_bloc/res/const.dart';
import 'package:fridge_yellow_team_bloc/services/dialog_service/dialog_service.dart';
import 'package:fridge_yellow_team_bloc/services/dialog_service/dialogs/error_dialog/error_dialog.dart';
import 'package:fridge_yellow_team_bloc/services/dialog_service/dialogs/error_dialog/error_dialog_widget.dart';
import 'package:fridge_yellow_team_bloc/services/network_service/models/base_http_response.dart';
import 'package:fridge_yellow_team_bloc/services/network_service/network_service.dart';
import 'package:fridge_yellow_team_bloc/services/network_service/res/consts.dart';
import 'package:fridge_yellow_team_bloc/services/network_service/shared/fridge_parser.dart';
import 'package:fridge_yellow_team_bloc/services/pop_up_service/pop_up_service.dart';
import 'package:fridge_yellow_team_bloc/services/pop_up_service/server_error_pop_up_widget.dart';
import 'package:fridge_yellow_team_bloc/services/user_information_service/user_information_service.dart';

class IngredientCubit extends Cubit<IngredientState> {
  IngredientCubit()
      : super(
          IngredientState(allIngredients: []),
        );

  Future<void> loadAllIngredients() async {
    if(state.allIngredients.isNotEmpty){
      return;
    }


    final bool isConnection = await NetworkService.instance.checkInternetConnection();

    if (isConnection == false) {
      DialogService.instance.show(
        dialog: ErrorDialog(
          child: ErrorDialogWidget(),
        ),
      );
      return;
    }

    final String token = await UserInformationService.instance.getToken();

    if(token == emptyString){
      return;
    }

    NetworkService.instance.init(baseUrl: baseUrl);
    final BaseHttpResponse response = await IngredientRepository.instance.fetchAllIngredientData(
      token: token,
    );

    if (response.error == null) {
      final List<Ingredient> ingredients = FridgeParser.instance.parseList(
        exampleObject: Ingredient,
        response: response,
      ) as List<Ingredient>;

      emit(
        state.copyWith(inputAllIngredients: ingredients),
      );
    } else {
      PopUpService.instance.show(
        widget: ServerErrorPopUpWidget(),
      );
    }
  }
}
