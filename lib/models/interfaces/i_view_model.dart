import 'package:redux/redux.dart';
import 'package:yellow_team_fridge/store/application/app_state.dart';

class IViewModel {
  static IViewModel fromStore(Store<AppState> store) {
    return IViewModel();
  }
}