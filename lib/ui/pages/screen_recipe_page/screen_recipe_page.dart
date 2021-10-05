import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:sliver_fab/sliver_fab.dart';
import 'package:yellow_team_fridge/dictionary/data/en.dart';
import 'package:yellow_team_fridge/dictionary/dictionary_classes/screen_recipe_language.dart';
import 'package:yellow_team_fridge/dictionary/flutter_dictionary.dart';
import 'package:yellow_team_fridge/res/app_styles/app_colors.dart';
import 'package:yellow_team_fridge/res/app_styles/app_gradient.dart';
import 'package:yellow_team_fridge/res/image_assets.dart';
import 'package:yellow_team_fridge/store/application/app_state.dart';
import 'package:yellow_team_fridge/ui/pages/screen_recipe_page/screen_recipe_page_vm.dart';
import 'package:yellow_team_fridge/ui/pages/screen_recipe_page/widgets/congratulation_block.dart';
import 'package:yellow_team_fridge/ui/pages/screen_recipe_page/widgets/cooking_block.dart';
import 'package:yellow_team_fridge/ui/pages/screen_recipe_page/widgets/food_elements_block/food_elements_block.dart';
import 'package:yellow_team_fridge/ui/pages/screen_recipe_page/widgets/similar_recipes_block.dart';

class ScreenRecipePage extends StatefulWidget {
  const ScreenRecipePage({
    Key key,
  }) : super(key: key);

  @override
  _ScreenRecipePageState createState() => _ScreenRecipePageState();
}

class _ScreenRecipePageState extends State<ScreenRecipePage>
    with SingleTickerProviderStateMixin {
  double height = 312.0;

  @override
  Widget build(BuildContext context) {
    final ScreenRecipeLanguage _language =
        FlutterDictionary.instance.language?.screenRecipeLanguage ??
            en.screenRecipeLanguage;
    return StoreConnector<AppState, ScreenRecipePageViewModel>(
      converter: ScreenRecipePageViewModel.init,
      builder: (BuildContext context, ScreenRecipePageViewModel viewModel) {
        return SafeArea(
          child: Scaffold(
            backgroundColor: AppColors.white,
            body: SliverFab(
              floatingWidget: Stack(
                children: [
                  Image.asset(
                    ImageAssets.addToFavoriteIcon,
                    height: 64.0,
                    width: 64.0,
                  ),
                  Positioned(
                    right: 11.0,
                    top: 13.0,
                    child: Icon(
                      Icons.favorite_sharp,
                      color: AppColors.red,
                      size: 42.0,
                    ),
                  ),
                ],
              ),
              floatingPosition: FloatingPosition(
                right: 14.0,
                top: -20.0,
              ),
              expandedHeight: 312.0,
              slivers: [
                SliverAppBar(
                  expandedHeight: 312.0,
                  collapsedHeight: 80.0,
                  pinned: true,
                  bottom: PreferredSize(
                    preferredSize: Size.fromHeight(0.0),
                    child: Transform.translate(
                      offset: Offset(160.0, -20.0),
                      child: Icon(
                        Icons.favorite_sharp,
                        color: AppColors.red,
                      ),
                    ),
                  ),
                  backgroundColor: AppColors.transparent,
                  flexibleSpace: LayoutBuilder(
                    builder: (context, constraints) {
                      height = constraints.biggest.height;
                      return Stack(
                        children: [
                          SizedBox(height: 312.0),
                          Container(
                            decoration: BoxDecoration(
                              gradient: height == 80.0
                                  ? AppGradient.white
                                  : AppGradient.black30black0,
                            ),
                            child: FlexibleSpaceBar(
                              background: viewModel.recipe.image == null
                                  ? Image.asset(ImageAssets.chefYellow)
                                  : Image.network(
                                      viewModel.recipe.image,
                                      fit: BoxFit.fill,
                                    ),
                            ),
                          ),
                          Positioned(
                            child: Container(
                              height: 13.0,
                              width: MediaQuery.of(context).size.width,
                              decoration: BoxDecoration(
                                color: AppColors.white,
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(10.0),
                                  topRight: Radius.circular(10.0),
                                ),
                              ),
                            ),
                            bottom: 0.0,
                          ),
                        ],
                      );
                    },
                  ),
                ),
                SliverList(
                  delegate: SliverChildBuilderDelegate(
                    (context, index) => Container(
                      decoration: BoxDecoration(
                        color: AppColors.white,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(10.0),
                          topRight: Radius.circular(10.0),
                        ),
                      ),
                      child: Column(
                        children: [
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 14.0),
                            child: Column(
                              children: [
                                FoodElementsBlock(
                                  recipe: viewModel.recipe,
                                  ingredientsStored: viewModel.ingredient,
                                ),
                                CookingBlock(recipe: viewModel.recipe),
                                CongratulationBlock(),
                              ],
                            ),
                          ),
                          SimilarRecipesBlock(listRecipes: viewModel.recipes),
                        ],
                      ),
                    ),
                    childCount: 1,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
