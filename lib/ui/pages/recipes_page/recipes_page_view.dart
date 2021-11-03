import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fridge_yellow_team_bloc/application/bloc/recipes_bloc.dart';
import 'package:fridge_yellow_team_bloc/application/bloc/recipes_state.dart';
import 'package:fridge_yellow_team_bloc/application/cubit/ingredients_cubit.dart';
import 'package:fridge_yellow_team_bloc/dictionary/data/en.dart';
import 'package:fridge_yellow_team_bloc/dictionary/dictionary_classes/recipes_page_language.dart';
import 'package:fridge_yellow_team_bloc/dictionary/flutter_dictionary.dart';
import 'package:fridge_yellow_team_bloc/models/pages/freezed/ingredient.dart';
import 'package:fridge_yellow_team_bloc/models/pages/freezed/recipe.dart';
import 'package:fridge_yellow_team_bloc/models/pages/models/screen_recipe_arguments.dart';
import 'package:fridge_yellow_team_bloc/res/app_fonts.dart';
import 'package:fridge_yellow_team_bloc/res/app_styles/app_colors.dart';
import 'package:fridge_yellow_team_bloc/res/app_styles/app_gradient.dart';
import 'package:fridge_yellow_team_bloc/res/const.dart';
import 'package:fridge_yellow_team_bloc/res/image_assets.dart';
import 'package:fridge_yellow_team_bloc/services/route_service/app_routes.dart';
import 'package:fridge_yellow_team_bloc/services/route_service/route_selectors.dart';
import 'package:fridge_yellow_team_bloc/ui/layouts/main_layout/main_layout.dart';
import 'package:fridge_yellow_team_bloc/ui/pages/favorite_page/widgets/recipe_element.dart';

class RecipesPageView extends StatelessWidget {
  const RecipesPageView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final RecipesPageLanguage language = FlutterDictionary.instance.language?.recipesPageLanguage ?? en.recipesPageLanguage;
    return BlocSelector<RecipesBloc, RecipesState, List<Recipe>>(
      selector: (RecipesState state) {
        return state.recipes;
      },
      builder: (BuildContext context, List<Recipe> recipes) {
        return MainLayout(
          title: language.recipes,
          appBarType: AppBarType.simple,
          isMainStyleAppBar: true,
          gradient: recipes.isEmpty ? AppGradient.wheatMarigoldGradient : null,
          color: recipes.isEmpty ? null : AppColors.wheat,
          currentPage: AppRoutes.recipes,
          onTapBack: RouteSelectors.doPop(),
          key: UniqueKey(),
          needPaddings: false,
          body: recipes.isEmpty
              ? Center(
                  child: Column(
                    children: [
                      Container(
                        margin: const EdgeInsets.symmetric(vertical: 90.0, horizontal: 70.0),
                        child: Text(
                          language.listEmpty,
                          style: AppFonts.normalBlackHeight30TextStyle,
                          softWrap: false,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      Flexible(
                        child: Image.asset(
                          ImageAssets.recipePageChef,
                        ),
                      ),
                    ],
                  ),
                )
              : ListView.builder(
                  itemCount: recipes.length,
                  itemBuilder: (BuildContext _, int index) {
                    return InkWell(
                      onTap: () {
                        RouteSelectors.goToScreenRecipePage(
                          arguments: ScreenRecipeArguments(
                            recipes: recipes,
                            index: index,
                          ),
                        ).call();
                      },
                      child: Padding(
                        padding: index == 0
                            ? const EdgeInsets.only(top: 21.0, left: 15.0, right: 15.0, bottom: 16.0)
                            : const EdgeInsets.only(left: 15.0, right: 15.0, bottom: 16.0),
                        child: RecipeElement(
                          key: ValueKey(recipes[index].i),
                          recipe: recipes[index],
                          needOpenFunction: true,
                          needFavoriteIcon: false,
                        ),
                      ),
                    );
                  },
                ),
        );
      },
    );
  }
}
