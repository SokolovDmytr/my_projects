import 'package:redux_epics/redux_epics.dart';
import 'package:rxdart/rxdart.dart';
import 'package:yellow_team_fridge/dictionary/flutter_delegate.dart';
import 'package:yellow_team_fridge/models/pages/ingredient.dart';
import 'package:yellow_team_fridge/models/pages/recipe.dart';
import 'package:yellow_team_fridge/services/network_service/models/base_http_response.dart';
import 'package:yellow_team_fridge/services/network_service/network_service.dart';
import 'package:yellow_team_fridge/services/network_service/res/consts.dart';
import 'package:yellow_team_fridge/services/network_service/res/request_params/get_recipe_params.dart';
import 'package:yellow_team_fridge/services/network_service/shared/fridge_parser.dart';
import 'package:yellow_team_fridge/services/user_information_service/user_information_service.dart';
import 'package:yellow_team_fridge/store/application/app_state.dart';
import 'package:yellow_team_fridge/store/recipes_page_state/actions/get_recipes_with_ingredients_action.dart';
import 'package:yellow_team_fridge/store/recipes_page_state/actions/save_recipe_list_action.dart';

class RecipesPageEpics {
  static final indexEpic = combineEpics<AppState>([
    getRecipes,
  ]);

  static Stream<dynamic> getRecipes(
    Stream<dynamic> actions,
    EpicStore<AppState> store,
  ) {
    return actions.whereType<GetRecipesWithIngredientsAction>().switchMap(
      (action) async* {
        final String token = await UserInformationService.instance.getToken();

        NetworkService.instance.init(baseUrl: baseUrl);
        final BaseHttpResponse response = await NetworkService.instance.requestWithParams(
          type: HttpType.httpGet,
          route: HttpRoute.getRecipe,
          parameter: GetRecipeParams(
            token: token,
            idList: action.ids,
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

          yield SaveRecipeListAction(
            recipes: recipes,
          );
        }
      },
    );
  }
}
