import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:fridge_yellow_team_bloc/dictionary/data/en.dart';
import 'package:fridge_yellow_team_bloc/dictionary/dictionary_classes/dialog_language.dart';
import 'package:fridge_yellow_team_bloc/dictionary/dictionary_classes/screen_recipe_language.dart';
import 'package:fridge_yellow_team_bloc/dictionary/flutter_dictionary.dart';
import 'package:fridge_yellow_team_bloc/models/pages/models/screen_recipe_arguments.dart';
import 'package:fridge_yellow_team_bloc/res/app_fonts.dart';
import 'package:fridge_yellow_team_bloc/res/app_styles/app_colors.dart';
import 'package:fridge_yellow_team_bloc/res/app_styles/app_gradient.dart';
import 'package:fridge_yellow_team_bloc/res/const.dart';
import 'package:fridge_yellow_team_bloc/res/image_assets.dart';
import 'package:fridge_yellow_team_bloc/services/dialog_service/dialog_service.dart';
import 'package:fridge_yellow_team_bloc/services/dialog_service/dialogs/remove_favourite_dialog/remove_favourite_dialog.dart';
import 'package:fridge_yellow_team_bloc/services/dialog_service/dialogs/remove_favourite_dialog/remove_favourite_widget.dart';
import 'package:fridge_yellow_team_bloc/services/route_service/route_selectors.dart';
import 'package:fridge_yellow_team_bloc/ui/global_widgets/navigation_bottom_bar.dart';
import 'package:fridge_yellow_team_bloc/ui/pages/screen_recipe_page/widgets/congratulation_block.dart';
import 'package:fridge_yellow_team_bloc/ui/pages/screen_recipe_page/widgets/cooking_block.dart';
import 'package:fridge_yellow_team_bloc/ui/pages/screen_recipe_page/widgets/custom_sliver_fab.dart';
import 'package:fridge_yellow_team_bloc/ui/pages/screen_recipe_page/widgets/food_elements_block.dart';
import 'package:fridge_yellow_team_bloc/ui/pages/screen_recipe_page/widgets/similar_recipes_block.dart';

class ScreenRecipePage extends StatefulWidget {
  final bool previousPageFavourite;

  const ScreenRecipePage({
    required this.previousPageFavourite,
    Key? key,
  }) : super(key: key);

  @override
  _ScreenRecipePageState createState() => _ScreenRecipePageState();
}

class _ScreenRecipePageState extends State<ScreenRecipePage> with SingleTickerProviderStateMixin {
  double height = 312.0;

  @override
  Widget build(BuildContext context) {
    final ScreenRecipeArguments arguments = ModalRoute.of(context)!.settings.arguments as ScreenRecipeArguments;
    final ScreenRecipeLanguage _languageScreenRecipePage = FlutterDictionary.instance.language?.screenRecipeLanguage ?? en.screenRecipeLanguage;
    final DialogLanguage _languageDialog = FlutterDictionary.instance.language?.dialogLanguage ?? en.dialogLanguage;
    return SafeArea(
      child: WillPopScope(
        onWillPop: () async {
          RouteSelectors.doPop();
          return false;
        },
        child: Scaffold(
          bottomNavigationBar: CustomNavigationBottomBar(
            currentPage: emptyString,
          ),
          backgroundColor: AppColors.white,
          body: CustomSliverFab(
            floatingWidget: InkWell(
              onTap: () {
                if (arguments.recipes[arguments.index].isFavorite) {
                  DialogService.instance.show(
                    dialog: RemoveFavouriteDialog(
                      child: RemoveFavouriteDialogWidget(
                        onTapYes: () {
                          //ToDo: remove from recipe
                        },
                      ),
                    ),
                  );
                } else if (arguments.recipes[arguments.index].isFavorite == false) {
                  //ToDo: add to favourite
                }
              },
              child: Stack(
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
                      color: true ? AppColors.red : AppColors.white,
                      size: 42.0,
                    ),
                  ),
                ],
              ),
            ),
            floatingPosition: FlutterDictionary.instance.isRTL
                ? FloatingPosition(
                    left: 14.0,
                    top: -20,
                  )
                : FloatingPosition(
                    right: 14.0,
                    top: -20.0,
                  ),
            expandedHeight: 312.0,
            slivers: [
              SliverAppBar(
                leadingWidth: 0.0,
                leading: const SizedBox(),
                expandedHeight: 312.0,
                collapsedHeight: 80.0,
                pinned: true,
                bottom: PreferredSize(
                  preferredSize: const Size.fromHeight(0.0),
                  child: Transform.translate(
                    offset: FlutterDictionary.instance.isRTL
                        ? Offset(-MediaQuery.of(context).size.width / 2 + 46.0, -20.0)
                        : Offset(MediaQuery.of(context).size.width / 2 - 46.0, -20.0),
                    child: InkWell(
                      // onTap: () {
                      //   if (true) {
                      //     DialogService.instance.show(
                      //       dialog: RemoveFavouriteDialog(
                      //         child: RemoveFavouriteDialogWidget(
                      //           onTapYes: () {
                      //             viewModel.removeFavoriteRecipe(
                      //               viewModel.recipe.i,
                      //             );
                      //             viewModel.recipe = viewModel.recipe.copyWith(isFavorite: false);
                      //           },
                      //         ),
                      //       ),
                      //     );
                      //   } else if (viewModel.recipe.isFavorite == false) {
                      //     viewModel.addFavoriteRecipe(viewModel.recipe.i.toString(), viewModel.recipe);
                      //     viewModel.recipe = viewModel.recipe.copyWith(isFavorite: true);
                      //     PopUpService.instance.show(
                      //       widget: RecipesPopUpWidget(
                      //         text: _languageDialog.recipePopUpAddedText,
                      //       ),
                      //     );
                      //   }
                      // },
                      child: Icon(
                        Icons.favorite_sharp,
                        color: arguments.recipes[arguments.index].isFavorite ? AppColors.red : AppColors.black.withOpacity(0.5),
                      ),
                    ),
                  ),
                ),
                backgroundColor: AppColors.transparent,
                flexibleSpace: LayoutBuilder(
                  builder: (context, constraints) {
                    height = constraints.biggest.height;
                    return Stack(
                      children: [
                        const SizedBox(height: 312.0),
                        Container(
                          decoration: BoxDecoration(
                            gradient: height == 80.0 ? AppGradient.transparent : AppGradient.black30black0,
                            image: DecorationImage(
                              image: arguments.recipes[arguments.index].image == null
                                  ? AssetImage(ImageAssets.chefYellow)
                                  : NetworkImage(arguments.recipes[arguments.index].image!) as ImageProvider,
                              fit: BoxFit.cover,
                              colorFilter: ColorFilter.mode(
                                AppColors.transparent,
                                arguments.recipes[arguments.index].image == null ? BlendMode.clear : BlendMode.color,
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          bottom: 0.0,
                          child: Container(
                            height: height == 80.0 ? 0.0 : 15.0,
                            width: MediaQuery.of(context).size.width,
                            decoration: BoxDecoration(
                              color: AppColors.white,
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(10.0),
                                topRight: Radius.circular(10.0),
                              ),
                            ),
                          ),
                        ),
                        InkWell(
                          borderRadius: BorderRadius.circular(10.0),
                          onTap: RouteSelectors.doPop(),
                          child: Padding(
                            padding: const EdgeInsets.only(left: 16.0),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              textDirection: FlutterDictionary.instance.isRTL ? TextDirection.rtl : TextDirection.ltr,
                              children: [
                                Container(
                                  margin: FlutterDictionary.instance.isRTL
                                      ? const EdgeInsets.only(top: 30.0, left: 8.0, right: 8.0)
                                      : const EdgeInsets.only(top: 30.0, right: 8.0),
                                  child: FlutterDictionary.instance.isRTL
                                      ? Transform.rotate(
                                          angle: math.pi,
                                          child: Image.asset(
                                            ImageAssets.backArrow,
                                            color: AppColors.white,
                                            height: 18.0,
                                          ),
                                        )
                                      : Image.asset(
                                          ImageAssets.backArrow,
                                          color: AppColors.white,
                                          height: 18.0,
                                        ),
                                ),
                                Container(
                                  padding: const EdgeInsets.only(top: 30.0),
                                  width: 80.0,
                                  child: Text(
                                    _languageScreenRecipePage.back,
                                    style: AppFonts.medium16Height24WhiteTextStyle,
                                  ),
                                ),
                              ],
                            ),
                          ),
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
                          padding: const EdgeInsets.symmetric(horizontal: 14.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(
                                  top: 20.0,
                                  bottom: 25.0,
                                ),
                                child: Text(
                                  arguments.recipes[index].name,
                                  style: AppFonts.normalBlackHeight30ShadowTextStyle,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(bottom: 35.0),
                                child: Row(
                                  children: [
                                    _getParameterOfRecipeWidget(
                                      imageAssets: ImageAssets.timeIcon,
                                      value: arguments.recipes[index].time.toString(),
                                      text: _languageScreenRecipePage.min,
                                      textStyle: AppFonts.smallTextStyle,
                                    ),
                                    _getParameterOfRecipeWidget(
                                      imageAssets: ImageAssets.caloriesIcon,
                                      value: arguments.recipes[index].calories.toStringAsFixed(1),
                                      text: _languageScreenRecipePage.cal,
                                      textStyle: AppFonts.smallTextStyle,
                                    ),
                                    arguments.recipes[index].level == null
                                        ? const SizedBox()
                                        : _getParameterOfRecipeWidget(
                                            imageAssets: ImageAssets.difficultyIcon,
                                            value: arguments.recipes[index].level!,
                                            textStyle: AppFonts.smallTextStyle,
                                          ),
                                  ],
                                ),
                              ),
                              FoodElementsBlock(
                                recipe: arguments.recipes[arguments.index],
                                ingredientsStored: viewModel.ingredient,
                              ),
                              CookingBlock(recipe: arguments.recipes[index]),
                              CongratulationBlock(),
                            ],
                          ),
                        ),
                        _similarRecipesBlock(arguments),
                      ],
                    ),
                  ),
                  childCount: 1,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // void _checkFavourites(ScreenRecipePageVM viewModel) {
  //   for (int index = 0; index < viewModel.allFavouritesRecipesList.length; index++) {
  //     if (viewModel.recipe.i == viewModel.allFavouritesRecipesList[index].i) {
  //       viewModel.recipe = viewModel.recipe.copyWith(isFavorite: true);
  //       // viewModel.addFavoriteRecipe(viewModel.recipe.i.toString(), viewModel.recipe);
  //     }
  //   }
  // }

  Widget _similarRecipesBlock(ScreenRecipeArguments arguments) {
    if (arguments.recipes.length == 1) {
      return const SizedBox(height: 50.0);
    }
    return SimilarRecipesBlock(
      recipes: arguments.recipes,
    );
  }

  Widget _getParameterOfRecipeWidget({
    required String imageAssets,
    required TextStyle textStyle,
    String? text,
    required String value,
  }) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 2.0),
      height: 20.0,
      width: 80.0,
      child: Row(
        textDirection: FlutterDictionary.instance.isRTL ? TextDirection.rtl : TextDirection.ltr,
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(
            imageAssets,
          ),
          Flexible(
            child: Container(
              margin: const EdgeInsets.only(
                left: 4.0,
                right: 4.0,
              ),
              child: Text(
                value,
                style: textStyle,
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
              ),
            ),
          ),
          text == null
              ? const SizedBox()
              : Text(
                  text,
                  style: textStyle,
                ),
        ],
      ),
    );
  }
}
