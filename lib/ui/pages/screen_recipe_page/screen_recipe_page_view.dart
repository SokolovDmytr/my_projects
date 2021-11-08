import 'dart:math' as math;

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fridge_yellow_team_bloc/application/bloc/recipes_bloc/recipes_bloc.dart';
import 'package:fridge_yellow_team_bloc/application/bloc/recipes_bloc/recipes_event.dart';
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
import 'package:fridge_yellow_team_bloc/services/pop_up_service/pop_up_service.dart';
import 'package:fridge_yellow_team_bloc/services/pop_up_service/recipes_pop_up_widget.dart';
import 'package:fridge_yellow_team_bloc/services/route_service/route_selectors.dart';
import 'package:fridge_yellow_team_bloc/ui/global_widgets/navigation_bottom_bar.dart';
import 'package:fridge_yellow_team_bloc/ui/pages/screen_recipe_page/cubit/screen_recipe_page_cubit.dart';
import 'package:fridge_yellow_team_bloc/ui/pages/screen_recipe_page/cubit/screen_recipe_page_state.dart';
import 'package:fridge_yellow_team_bloc/ui/pages/screen_recipe_page/widgets/congratulation_block.dart';
import 'package:fridge_yellow_team_bloc/ui/pages/screen_recipe_page/widgets/cooking_block.dart';
import 'package:fridge_yellow_team_bloc/ui/pages/screen_recipe_page/widgets/custom_sliver_fab.dart';
import 'package:fridge_yellow_team_bloc/ui/pages/screen_recipe_page/widgets/food_elements_block.dart';
import 'package:fridge_yellow_team_bloc/ui/pages/screen_recipe_page/widgets/similar_recipes_block.dart';
import 'package:provider/src/provider.dart';

class ScreenRecipePageView extends StatefulWidget {
  final ScreenRecipeArguments arguments;

  const ScreenRecipePageView({
    required this.arguments,
    Key? key,
  }) : super(key: key);

  @override
  _ScreenRecipePageViewState createState() => _ScreenRecipePageViewState();
}

class _ScreenRecipePageViewState extends State<ScreenRecipePageView> with SingleTickerProviderStateMixin {
  double height = 312.0;
  final ScreenRecipeLanguage _languageScreenRecipePage = FlutterDictionary.instance.language.screenRecipeLanguage;
  final DialogLanguage _languageDialog = FlutterDictionary.instance.language.dialogLanguage;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ScreenRecipePageCubit, ScreenRecipePageState>(
      builder: (context, state) => SafeArea(
        child: WillPopScope(
          onWillPop: () async {
            RouteSelectors.doPop().call();
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
                  if (context.read<ScreenRecipePageCubit>().state.isFavourite) {
                    DialogService.instance.show(
                      dialog: RemoveFavouriteDialog(
                        child: RemoveFavouriteDialogWidget(
                          onTapYes: () {
                            context.read<RecipesBloc>().add(
                                  RemoveFavouriteRecipeEvent(
                                    recipe: widget.arguments.recipes[widget.arguments.index],
                                  ),
                                );
                            context.read<ScreenRecipePageCubit>().updateFavouriteStatus(isFavourite: false);
                          },
                        ),
                      ),
                    );
                  } else if (context.read<ScreenRecipePageCubit>().state.isFavourite == false) {
                    context.read<RecipesBloc>().add(
                          AddFavouritesRecipeEvent(
                            recipe: widget.arguments.recipes[widget.arguments.index],
                          ),
                        );
                    context.read<ScreenRecipePageCubit>().updateFavouriteStatus(isFavourite: true);
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
                        color: context.read<ScreenRecipePageCubit>().state.isFavourite ? AppColors.red : AppColors.white,
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
                        onTap: () {
                          if (widget.arguments.recipes[widget.arguments.index].isFavorite) {
                            DialogService.instance.show(
                              dialog: RemoveFavouriteDialog(
                                child: RemoveFavouriteDialogWidget(
                                  onTapYes: () {
                                    context.read<RecipesBloc>().add(
                                          RemoveFavouriteRecipeEvent(
                                            recipe: widget.arguments.recipes[widget.arguments.index],
                                          ),
                                        );
                                    context.read<ScreenRecipePageCubit>().updateFavouriteStatus(isFavourite: false);
                                  },
                                ),
                              ),
                            );
                          } else if (widget.arguments.recipes[widget.arguments.index].isFavorite == false) {
                            context.read<RecipesBloc>().add(
                                  AddFavouritesRecipeEvent(
                                    recipe: widget.arguments.recipes[widget.arguments.index],
                                  ),
                                );
                            context.read<ScreenRecipePageCubit>().updateFavouriteStatus(isFavourite: true);
                            PopUpService.instance.show(
                              widget: RecipesPopUpWidget(
                                text: _languageDialog.recipePopUpAddedText,
                              ),
                            );
                          }
                        },
                        child: Icon(
                          Icons.favorite_sharp,
                          color: context.read<ScreenRecipePageCubit>().state.isFavourite ? AppColors.red : AppColors.black.withOpacity(0.5),
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
                          Container(
                            height: 312.0,
                            decoration: BoxDecoration(
                              gradient: height == 80.0 ? AppGradient.transparent : AppGradient.black30black0,
                            ),
                          ),
                          widget.arguments.recipes[widget.arguments.index].image == null
                              ? height == 80.0
                                  ? const SizedBox()
                                  : Center(
                                      child: Image.asset(ImageAssets.chefYellow),
                                    )
                              : CachedNetworkImage(
                                  imageUrl: widget.arguments.recipes[widget.arguments.index].image!,
                                  imageBuilder: (
                                    BuildContext _,
                                    ImageProvider image,
                                  ) {
                                    return Container(
                                      decoration: BoxDecoration(
                                        image: DecorationImage(
                                          image: image,
                                          fit: BoxFit.cover,
                                          colorFilter: ColorFilter.mode(
                                            AppColors.transparent,
                                            widget.arguments.recipes[widget.arguments.index].image == null ? BlendMode.clear : BlendMode.color,
                                          ),
                                        ),
                                      ),
                                      child: FlexibleSpaceBar(
                                        background: Image.network(
                                          widget.arguments.recipes[widget.arguments.index].image ?? ImageAssets.chefYellow,
                                          fit: BoxFit.fill,
                                          errorBuilder: (
                                            BuildContext _,
                                            Object __,
                                            StackTrace? ___,
                                          ) {
                                            return Image.asset(
                                              ImageAssets.chefYellow,
                                            );
                                          },
                                        ),
                                      ),
                                    );
                                  },
                                  errorWidget: (
                                    BuildContext context,
                                    String url,
                                    dynamic error,
                                  ) {
                                    return height == 80.0
                                        ? const SizedBox()
                                        : Center(
                                            child: Image.asset(
                                              ImageAssets.chefYellow,
                                            ),
                                          );
                                  },
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
                                Row(
                                  children: [
                                    Flexible(
                                      child: Padding(
                                        padding: const EdgeInsets.only(
                                          top: 20.0,
                                          bottom: 25.0,
                                        ),
                                        child: Text(
                                          widget.arguments.recipes[widget.arguments.index].name,
                                          style: AppFonts.normalBlackHeight30ShadowTextStyle,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(bottom: 35.0),
                                  child: Row(
                                    children: [
                                      _getParameterOfRecipeWidget(
                                        imageAssets: ImageAssets.timeIcon,
                                        value: widget.arguments.recipes[widget.arguments.index].time.toString(),
                                        text: _languageScreenRecipePage.min,
                                        textStyle: AppFonts.smallTextStyle,
                                      ),
                                      _getParameterOfRecipeWidget(
                                        imageAssets: ImageAssets.caloriesIcon,
                                        value: widget.arguments.recipes[widget.arguments.index].calories.toStringAsFixed(1),
                                        text: _languageScreenRecipePage.cal,
                                        textStyle: AppFonts.smallTextStyle,
                                      ),
                                      widget.arguments.recipes[widget.arguments.index].level == null
                                          ? const SizedBox()
                                          : _getParameterOfRecipeWidget(
                                              imageAssets: ImageAssets.difficultyIcon,
                                              value: widget.arguments.recipes[widget.arguments.index].level!,
                                              textStyle: AppFonts.smallTextStyle,
                                            ),
                                    ],
                                  ),
                                ),
                                FoodElementsBlock(
                                  recipe: widget.arguments.recipes[widget.arguments.index],
                                ),
                                CookingBlock(recipe: widget.arguments.recipes[widget.arguments.index]),
                                CongratulationBlock(),
                              ],
                            ),
                          ),
                          _similarRecipesBlock(widget.arguments),
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
      ),
    );
  }

  Widget _similarRecipesBlock(ScreenRecipeArguments arguments) {
    if (arguments.recipes.length == 1) {
      return const SizedBox(height: 50.0);
    }
    return SimilarRecipesBlock(
      arguments: arguments,
    );
  }

  Widget _getParameterOfRecipeWidget({
    required String imageAssets,
    required TextStyle textStyle,
    required String value,
    String? text,
  }) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 2.0),
      child: Row(
        children: [
          Image.asset(
            imageAssets,
          ),
          Container(
            margin: const EdgeInsets.only(
              left: 4.0,
              right: 4.0,
            ),
            child: Text(
              value,
              style: textStyle,
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
