import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fridge_yellow_team_bloc/application/bloc/recipes_bloc.dart';
import 'package:fridge_yellow_team_bloc/application/bloc/recipes_state.dart';
import 'package:fridge_yellow_team_bloc/dictionary/data/en.dart';
import 'package:fridge_yellow_team_bloc/dictionary/dictionary_classes/favorites_page_language.dart';
import 'package:fridge_yellow_team_bloc/dictionary/flutter_dictionary.dart';
import 'package:fridge_yellow_team_bloc/models/pages/freezed/recipe.dart';
import 'package:fridge_yellow_team_bloc/res/app_styles/app_colors.dart';
import 'package:fridge_yellow_team_bloc/res/app_styles/app_gradient.dart';
import 'package:fridge_yellow_team_bloc/res/const.dart';
import 'package:fridge_yellow_team_bloc/services/route_service/app_routes.dart';
import 'package:fridge_yellow_team_bloc/services/route_service/route_selectors.dart';
import 'package:fridge_yellow_team_bloc/ui/layouts/main_layout/main_layout.dart';
import 'package:fridge_yellow_team_bloc/ui/pages/favorite_page/widgets/recipes_list.dart';

class FavouritesPageView extends StatefulWidget {
  const FavouritesPageView({Key? key}) : super(key: key);

  @override
  _FavouritesPageViewState createState() => _FavouritesPageViewState();
}

class _FavouritesPageViewState extends State<FavouritesPageView> {
  @override
  Widget build(BuildContext context) {
    final FavouritesPageLanguage _language = FlutterDictionary.instance.language?.favouritesPageLanguage ?? en.favouritesPageLanguage; // TODO(Kolya): out of the builder and without null check, check it everywhere
    return BlocSelector<RecipesBloc, RecipesState, List<Recipe>>(
      selector: (RecipesState state) {
        return state.favoriteRecipes;
      },
      builder: (BuildContext context, List<Recipe> recipes) => MainLayout(
        appBarType: AppBarType.simple,
        isMainStyleAppBar: true,
        gradient: recipes.isEmpty ? AppGradient.wheatMarigoldGradient : null,
        color: recipes.isEmpty ? null : AppColors.wheat,
        title: _language.favourites,
        currentPage: AppRoutes.favorites,
        onTapBack: RouteSelectors.doPop(),
        needPaddings: false,
        body: RecipesList(),
      ),
    );
  }
}
