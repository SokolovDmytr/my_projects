import 'package:redux_epics/redux_epics.dart';
import 'package:rxdart/rxdart.dart';
import 'package:yellow_team_fridge/models/pages/token.dart';
import 'package:yellow_team_fridge/services/user_information_service/user_information_service.dart';
import 'package:yellow_team_fridge/store/application/action/init_app_action.dart';
import 'package:yellow_team_fridge/store/application/app_state.dart';
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
            final Token token = await UserInformationService.instance.init();

            if(token != null){
              yield SaveTokenAction(token: token);
            }
      },
    );
  }
}
