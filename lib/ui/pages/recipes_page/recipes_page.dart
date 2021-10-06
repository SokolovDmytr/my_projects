import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:yellow_team_fridge/res/app_styles/app_colors.dart';
import 'package:yellow_team_fridge/res/const.dart';
import 'package:yellow_team_fridge/services/route_service/app_routes.dart';
import 'package:yellow_team_fridge/store/application/app_state.dart';
import 'package:yellow_team_fridge/ui/layouts/main_layout/main_layout.dart';
import 'package:yellow_team_fridge/ui/pages/favourites_page/widgets/recipe_element.dart';
import 'package:yellow_team_fridge/ui/pages/recipes_page/recipes_page_view_model.dart';

class RecipesPage extends StatefulWidget {
  @override
  _RecipesPageState createState() => _RecipesPageState();
}

class _RecipesPageState extends State<RecipesPage> {
  @override
  Widget build(BuildContext _) {
    return StoreConnector<AppState, RecipesPageViewModel>(
      converter: RecipesPageViewModel.init,
      onInitialBuild: (RecipesPageViewModel vm) => vm.fetchData(),
      builder: (BuildContext context, RecipesPageViewModel vm){
        return MainLayout(
          appBarType: AppBarType.simple,
          isMainStyleAppBar: true,
          color: AppColors.wheat,
          currentPage: AppRoutes.recipes,
          onTapBack: vm.onTapBack,
          key: UniqueKey(),
          body: ListView.builder(
            itemCount: vm.recipes.length,
            itemBuilder: (BuildContext _, int index) {
              return RecipeElement(
                recipe: vm.recipes[index],
              );
            },
          ),
        );
      },
    );
  }
}
