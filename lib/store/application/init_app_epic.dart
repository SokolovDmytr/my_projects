import 'package:redux_epics/redux_epics.dart';
import 'package:rxdart/rxdart.dart';
import 'package:yellow_team_fridge/dictionary/flutter_delegate.dart';
import 'package:yellow_team_fridge/models/pages/ingredient.dart';
import 'package:yellow_team_fridge/models/pages/recipe.dart';
import 'package:yellow_team_fridge/models/pages/token.dart';
import 'package:yellow_team_fridge/services/network_service/models/base_http_response.dart';
import 'package:yellow_team_fridge/services/network_service/network_service.dart';
import 'package:yellow_team_fridge/services/network_service/res/consts.dart';
import 'package:yellow_team_fridge/services/network_service/res/request_params/get_favorites_params.dart';
import 'package:yellow_team_fridge/services/network_service/shared/fridge_parser.dart';
import 'package:yellow_team_fridge/services/user_information_service/user_information_service.dart';
import 'package:yellow_team_fridge/store/application/action/init_app_action.dart';
import 'package:yellow_team_fridge/store/application/app_state.dart';
import 'package:yellow_team_fridge/store/favorite_state/action/get_favorite_recipe_action.dart';
import 'package:yellow_team_fridge/store/favorite_state/action/save_favorite_recipe_action.dart';
import 'package:yellow_team_fridge/store/token_state/actions/save_token_action.dart';

class InitAppEpic {
  static final indexEpic = combineEpics<AppState>([
    initAppEpic,
  ]);

  static Stream<dynamic> initAppEpic(
      Stream<dynamic> actions,
      EpicStore<AppState> store,
      ) {
    return actions.whereType<InitAppAction>().switchMap(
          (action) async* {
            Token token = await UserInformationService.instance.init();

            print('initAppEpic ${token?.token}');


            if(token != null){
              yield SaveTokenAction(token: token);
            }
      },
    );
  }
}
