import 'package:flutter/material.dart';
import 'package:fridge_yellow_team_bloc/dictionary/data/en.dart';
import 'package:fridge_yellow_team_bloc/dictionary/dictionary_classes/favorites_page_language.dart';
import 'package:fridge_yellow_team_bloc/dictionary/flutter_dictionary.dart';
import 'package:fridge_yellow_team_bloc/res/app_styles/app_colors.dart';
import 'package:fridge_yellow_team_bloc/res/app_styles/app_gradient.dart';
import 'package:fridge_yellow_team_bloc/res/const.dart';
import 'package:fridge_yellow_team_bloc/services/route_service/app_routes.dart';
import 'package:fridge_yellow_team_bloc/services/route_service/route_selectors.dart';
import 'package:fridge_yellow_team_bloc/ui/layouts/main_layout/main_layout.dart';
import 'package:fridge_yellow_team_bloc/ui/pages/favorite_page/widgets/recipes_list.dart';

class FavouritesPage extends StatelessWidget {
  const FavouritesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final FavouritesPageLanguage _language = FlutterDictionary.instance.language?.favouritesPageLanguage ?? en.favouritesPageLanguage;
    return MainLayout(
      appBarType: AppBarType.simple,
      isMainStyleAppBar: true,
      gradient: true ? AppGradient.wheatMarigoldGradient : null,
      color: false ? null : AppColors.wheat,
      title: _language.favourites,
      currentPage: AppRoutes.favorites,
      onTapBack: RouteSelectors.doPop(),
      needPaddings: false,
      body: RecipesList(),
    );
  }
}
