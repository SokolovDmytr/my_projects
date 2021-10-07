import 'package:redux_epics/redux_epics.dart';
import 'package:rxdart/rxdart.dart';
import 'package:yellow_team_fridge/dictionary/flutter_delegate.dart';
import 'package:yellow_team_fridge/models/pages/ingredient.dart';
import 'package:yellow_team_fridge/models/pages/recipe.dart';
import 'package:yellow_team_fridge/services/network_service/models/base_http_response.dart';
import 'package:yellow_team_fridge/services/network_service/network_service.dart';
import 'package:yellow_team_fridge/services/network_service/res/consts.dart';
import 'package:yellow_team_fridge/services/network_service/res/request_params/get_favorites_params.dart';
import 'package:yellow_team_fridge/services/network_service/shared/fridge_parser.dart';
import 'package:yellow_team_fridge/services/user_information_service/user_information_service.dart';
import 'package:yellow_team_fridge/store/application/app_state.dart';
import 'package:yellow_team_fridge/store/favorite_state/action/get_favorite_recipe_action.dart';
import 'package:yellow_team_fridge/store/favorite_state/action/save_favorite_recipe_action.dart';
import 'package:yellow_team_fridge/services/dialog_service/dialogs/error_dialog/error_dialog.dart';
import 'package:yellow_team_fridge/services/dialog_service/dialogs/error_dialog/error_dialog_widget.dart';
import 'package:yellow_team_fridge/services/pop_up_service/pop_up_service.dart';
import 'package:yellow_team_fridge/services/pop_up_service/server_error_pop_up_widget.dart';
import 'package:yellow_team_fridge/store/shared/dialog_state/actions/force_close_dialog_action.dart';
import 'package:yellow_team_fridge/store/shared/dialog_state/actions/show_dialog_action.dart';
import 'package:yellow_team_fridge/services/dialog_service/dialogs/loader/loader_pop_up.dart';
import 'package:yellow_team_fridge/services/dialog_service/dialogs/loader/loader_widget.dart';
import 'package:yellow_team_fridge/store/shared/loader/loader_state.dart';

class FavoriteEpics {
  static final indexEpic = combineEpics<AppState>([
    getFavoriteRecipeEpic,
  ]);

  static Stream<dynamic> getFavoriteRecipeEpic(
    Stream<dynamic> actions,
    EpicStore<AppState> store,
  ) {
    return actions.whereType<GetFavoriteRecipeAction>().switchMap(
      (action) async* {
        yield ShowDialogAction(
          dialog: LoaderPopUp(
            loaderKey: LoaderKey.getData,
            child: LoaderWidget(),
          ),
        );

        bool isConnection = await NetworkService.instance.checkInternetConnection();

        if (isConnection == false) {
          yield ForceCloseDialogAction();

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
          route: HttpRoute.getFavorite,
          parameter: GetFavoritesParams(
            token: token,
            locale: FlutterDictionaryDelegate.getCurrentLocale,
          ),
        );

        if (response.error == null) {
          final List<Recipe> recipes = FridgeParser.instance.parseList(
            exampleObject: Recipe,
            response: response,
          );

          List<Ingredient> ingredients = store.state.homePageState.allIngredient;

          for(Recipe recipe in recipes){
            for(Ingredient ingredient in recipe.ingredients){
              for(Ingredient dataIngredient in ingredients){
                if(ingredient.i == dataIngredient.i){
                  ingredient.name = dataIngredient.name;
                  ingredient.image = dataIngredient.image;
                }
              }
            }
          }

          yield SaveFavoriteRecipeAction(
            recipes: recipes,
          );

          yield ForceCloseDialogAction();
        } else {
          yield ForceCloseDialogAction();

          PopUpService.instance.show(
            widget: ServerErrorPopUpWidget(),
          );
        }
      },
    );
  }
}
