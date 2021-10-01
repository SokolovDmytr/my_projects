import 'package:flutter/material.dart';
import 'package:yellow_team_fridge/dictionary/data/en.dart';
import 'package:yellow_team_fridge/dictionary/dictionary_classes/favorites_page_language.dart';
import 'package:yellow_team_fridge/dictionary/flutter_dictionary.dart';
import 'package:yellow_team_fridge/res/app_styles/app_colors.dart';
import 'package:yellow_team_fridge/res/const.dart';
import 'package:yellow_team_fridge/services/route_service/app_routes.dart';
import 'package:yellow_team_fridge/ui/layouts/pages_layout/pages_layout.dart';
import 'package:yellow_team_fridge/ui/pages/favourites_page/widgets/recipes_list.dart';

class FavouritesPage extends StatelessWidget {
  const FavouritesPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final FavouritesPageLanguage _language =
        FlutterDictionary.instance.language?.favouritesPageLanguage ?? en.favouritesPageLanguage;
    return MainLayout(
      appBarType: AppBarType.simple,
      isMainStyleAppBar: true,
      color: AppColors.wheat,
      title: _language.favourites,
      currentPage: AppRoutes.favorites,
      body: RecipesList(),
    );
  }
}
