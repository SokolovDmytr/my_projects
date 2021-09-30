import 'package:redux_epics/redux_epics.dart';
import 'package:rxdart/rxdart.dart';
import 'package:yellow_team_fridge/dictionary/flutter_delegate.dart';
import 'package:yellow_team_fridge/models/pages/ingredient.dart';
import 'package:yellow_team_fridge/services/network_service/models/base_http_response.dart';
import 'package:yellow_team_fridge/services/network_service/network_service.dart';
import 'package:yellow_team_fridge/services/network_service/res/consts.dart';
import 'package:yellow_team_fridge/services/network_service/res/request_params/get_ingredients_params.dart';
import 'package:yellow_team_fridge/services/network_service/shared/fridge_parser.dart';
import 'package:yellow_team_fridge/store/application/app_state.dart';
import 'package:yellow_team_fridge/store/home_page_state/action/get_ingredients_with_string_action.dart';
import 'package:yellow_team_fridge/store/home_page_state/action/save_temp_ingredients_action.dart';

class HomePageEpics {
  static final indexEpic = combineEpics<AppState>([
    getIngredients,
  ]);

  static Stream<dynamic> getIngredients(
    Stream<dynamic> actions,
    EpicStore<AppState> store,
  ) {
    return actions.whereType<GetIngredientsWithStringAction>().switchMap(
      (action) async* {
        NetworkService.instance.init(baseUrl: baseUrl);
        final BaseHttpResponse response = await NetworkService.instance.requestWithParams(
          type: HttpType.httpGet,
          route: HttpRoute.getIngredients,
          parameter: GetIngredientsParams(
            token: tmp_token,
            locale: FlutterDictionaryDelegate.getCurrentLocale,
            str: action.name,
          ),
        );

        if (response.error == null) {
          final List<Ingredient> ingredients = FridgeParser.instance.parse(
            exampleObject: Ingredient,
            response: response,
          );

          yield SaveTempIngredientsAction(
            ingredients: ingredients,
          );
        }
      },
    );
  }
}
