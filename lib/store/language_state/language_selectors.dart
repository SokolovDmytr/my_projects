import 'package:redux/redux.dart';
import 'package:yellow_team_fridge/store/application/app_state.dart';
import 'package:yellow_team_fridge/store/language_state/actions/set_language_action.dart';

class LanguageSelectors {
  static String getCurrentLanguage(Store<AppState> store) {
    return store.state.languageState.language;
  }

  static void Function(String languageCode) setLanguage(Store<AppState> store) {
    return (String languageCode) => store.dispatch(SetLanguageAction(languageCode: languageCode));
  }
}
