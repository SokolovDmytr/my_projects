import 'package:redux_epics/redux_epics.dart';
import 'package:rxdart/rxdart.dart';
import 'package:yellow_team_fridge/dictionary/flutter_delegate.dart';
import 'package:yellow_team_fridge/models/pages/ingredient.dart';
import 'package:yellow_team_fridge/res/const.dart';
import 'package:yellow_team_fridge/services/network_service/models/base_http_response.dart';
import 'package:yellow_team_fridge/services/network_service/network_service.dart';
import 'package:yellow_team_fridge/services/network_service/res/consts.dart';
import 'package:yellow_team_fridge/services/network_service/res/request_params/get_ingredients_params.dart';
import 'package:yellow_team_fridge/services/network_service/shared/fridge_parser.dart';
import 'package:yellow_team_fridge/services/user_information_service/user_information_service.dart';
import 'package:yellow_team_fridge/store/application/app_state.dart';
import 'package:yellow_team_fridge/store/home_page_state/action/get_all_ingredient_action.dart';
import 'package:yellow_team_fridge/store/home_page_state/action/get_ingredients_with_string_action.dart';
import 'package:yellow_team_fridge/store/home_page_state/action/save_all_ingredient_action.dart';
import 'package:yellow_team_fridge/store/home_page_state/action/save_temp_ingredients_action.dart';
import 'package:yellow_team_fridge/services/dialog_service/dialogs/error_dialog/error_dialog.dart';
import 'package:yellow_team_fridge/services/dialog_service/dialogs/error_dialog/error_dialog_widget.dart';
import 'package:yellow_team_fridge/services/pop_up_service/pop_up_service.dart';
import 'package:yellow_team_fridge/services/pop_up_service/server_error_pop_up_widget.dart';
import 'package:yellow_team_fridge/store/shared/dialog_state/actions/show_dialog_action.dart';
import 'package:yellow_team_fridge/store/shared/loader/actions/show_loader_action.dart';
import 'package:yellow_team_fridge/store/shared/loader/actions/hide_loader_action.dart';

class HomePageEpics {
  static final indexEpic = combineEpics<AppState>([
    getIngredients,
    getAllIngredients,
  ]);

  static Stream<dynamic> getIngredients(
    Stream<dynamic> actions,
    EpicStore<AppState> store,
  ) {
    return actions.whereType<GetIngredientsWithStringAction>().switchMap(
      (action) async* {
        yield ShowLoaderAction();

        final bool isConnection = await NetworkService.instance.checkInternetConnection();

        if (isConnection == false) {
          yield ShowDialogAction(
            dialog: ErrorDialog(
              child: ErrorDialogWidget(),
            ),
          );
          return;
        }

        final String token = await UserInformationService.instance.getToken();

        NetworkService.instance.init(baseUrl: baseUrl);
        final BaseHttpResponse response = await NetworkService.instance.requestWithParams(
          type: HttpType.httpGet,
          route: HttpRoute.getIngredients,
          parameter: GetIngredientsParams(
            token: token,
            locale: FlutterDictionaryDelegate.getCurrentLocale,
            str: action.name,
          ),
        );

        if (response.error == null) {
          final List<Ingredient> ingredients = FridgeParser.instance.parseList(
            exampleObject: Ingredient,
            response: response,
          );

          yield HideLoaderAction();

          yield SaveTempIngredientsAction(
            ingredients: ingredients,
          );
        } else {
          PopUpService.instance.show(
            widget: ServerErrorPopUpWidget(),
          );
        }
      },
    );
  }

  static Stream<dynamic> getAllIngredients(
    Stream<dynamic> actions,
    EpicStore<AppState> store,
  ) {
    return actions.whereType<GetAllIngredientAction>().switchMap(
      (action) async* {
        final bool isConnection = await NetworkService.instance.checkInternetConnection();

        if (isConnection == false) {
          yield ShowDialogAction(
            dialog: ErrorDialog(
              child: ErrorDialogWidget(),
            ),
          );
          return;
        }

        final String token = await UserInformationService.instance.getToken();

        NetworkService.instance.init(baseUrl: baseUrl);
        final BaseHttpResponse response = await NetworkService.instance.requestWithParams(
          type: HttpType.httpGet,
          route: HttpRoute.getIngredients,
          parameter: GetIngredientsParams(
            token: token,
            locale: FlutterDictionaryDelegate.getCurrentLocale,
            str: emptyString,
          ),
        );

        if (response.error == null) {
          final List<Ingredient> ingredients = FridgeParser.instance.parseList(
            exampleObject: Ingredient,
            response: response,
          );

          yield SaveAllIngredientAction(
            ingredients: ingredients,
          );
        } else {
          PopUpService.instance.show(
            widget: ServerErrorPopUpWidget(),
          );
        }
      },
    );
  }
}
