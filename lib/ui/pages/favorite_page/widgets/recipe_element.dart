import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:fridge_yellow_team_bloc/dictionary/data/en.dart';
import 'package:fridge_yellow_team_bloc/dictionary/dictionary_classes/favorites_page_language.dart';
import 'package:fridge_yellow_team_bloc/dictionary/flutter_dictionary.dart';
import 'package:fridge_yellow_team_bloc/models/pages/freezed/ingredient.dart';
import 'package:fridge_yellow_team_bloc/models/pages/freezed/recipe.dart';
import 'package:fridge_yellow_team_bloc/res/app_duration.dart';
import 'package:fridge_yellow_team_bloc/res/app_fonts.dart';
import 'package:fridge_yellow_team_bloc/res/app_styles/app_colors.dart';
import 'package:fridge_yellow_team_bloc/res/app_styles/app_shadows.dart';
import 'package:fridge_yellow_team_bloc/res/const.dart';
import 'package:fridge_yellow_team_bloc/res/image_assets.dart';
import 'package:fridge_yellow_team_bloc/services/cache_manager/ingredient_image_cache_manager.dart';
import 'package:fridge_yellow_team_bloc/services/dialog_service/dialog_service.dart';
import 'package:fridge_yellow_team_bloc/services/dialog_service/dialogs/remove_favourite_dialog/remove_favourite_dialog.dart';
import 'package:fridge_yellow_team_bloc/services/dialog_service/dialogs/remove_favourite_dialog/remove_favourite_widget.dart';
import 'package:fridge_yellow_team_bloc/services/route_service/route_service.dart';

class RecipeElement extends StatefulWidget {
  final Recipe recipe;
  final bool needOpenFunction;
  final bool needFavoriteIcon;

  const RecipeElement({
    required this.recipe,
    required this.needOpenFunction,
    required this.needFavoriteIcon,
    Key? key,
  }) : super(key: key);

  @override
  _RecipeElementState createState() => _RecipeElementState();
}

class _RecipeElementState extends State<RecipeElement> with TickerProviderStateMixin {
  final FocusNode _focusNode = FocusNode();
  late List<Ingredient> _missingIngredients;
  FavouritesPageLanguage? language;

  @override
  void initState() {
    super.initState();
    _focusNode.addListener(() {
      if (!_focusNode.hasFocus) {
        setState(() {});
      }
    });
    _missingIngredients = [];/*CustomComparator.getMissingIngredients(
      recipe: widget.recipe,
      ingredients: StoreProvider.of<AppState>(context, listen: false).state.homePageState.ingredients,
    );*/
  }

  @override
  Widget build(BuildContext context) {
    language = FlutterDictionary.instance.language?.favouritesPageLanguage ?? en.favouritesPageLanguage;
    return AnimatedSize(
      duration: AppDuration.recipeOpenDuration,
      child: Container(
        decoration: BoxDecoration(
          boxShadow: AppShadows.recipeElementShadow,
        ),
        child: Stack(
          children: [
            Container(
              height: _focusNode.hasFocus ? 168.0 : 128.0,
              margin: EdgeInsets.fromLTRB(
                FlutterDictionary.instance.isRTL
                    ? 0.0
                    : _focusNode.hasFocus
                        ? 0.0
                        : 118.0,
                _focusNode.hasFocus ? 126.0 : 0.0,
                FlutterDictionary.instance.isRTL
                    ? _focusNode.hasFocus
                        ? 0.0
                        : 118.0
                    : 0.0,
                0.0,
              ),
              decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: _focusNode.hasFocus
                    ? BorderRadius.only(
                        bottomLeft: Radius.circular(10.0),
                        bottomRight: Radius.circular(10.0),
                      )
                    : FlutterDictionary.instance.isRTL
                        ? BorderRadius.only(
                            topLeft: Radius.circular(10.0),
                            bottomLeft: Radius.circular(10.0),
                          )
                        : BorderRadius.only(
                            topRight: Radius.circular(10.0),
                            bottomRight: Radius.circular(10.0),
                          ),
                border: Border.all(
                  color: _missingIngredients.isEmpty ? AppColors.white : AppColors.pastelRed,
                ),
              ),
              child: _focusNode.hasFocus
                  ? Column(
                      children: [
                        Container(
                          margin: const EdgeInsets.all(10.0),
                          alignment: Alignment.centerLeft,
                          child: Text(
                            language!.youDoNotHave,
                            style: AppFonts.smallPaselRed16TextStyle,
                          ),
                        ),
                        Expanded(
                          child: GridView.count(
                            primary: false,
                            padding: const EdgeInsets.all(10.0),
                            crossAxisSpacing: 10,
                            mainAxisSpacing: 10,
                            childAspectRatio: 4.0,
                            crossAxisCount: 2,
                            children: _missingIngredients.map((e) {
                              return Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Container(
                                      height: 32.0,
                                      width: 32.0,
                                      margin: const EdgeInsets.symmetric(horizontal: 3.0),
                                      child: IngredientImageCacheManager.instance.getImageWithIdIngredient(ingredient: e) ??
                                          CachedNetworkImage(
                                            imageUrl: e.image!,
                                            imageBuilder: (BuildContext _, ImageProvider imageProvider) {
                                              return Image(image: imageProvider);
                                            },
                                            placeholder: (context, url) => SizedBox(
                                              width: baseHeightOfIngredientElement,
                                              child: Image.asset(ImageAssets.chefYellow),
                                            ),
                                            errorWidget: (context, url, error) {
                                              return Image.asset(ImageAssets.chefYellow);
                                            },
                                          )),
                                  Flexible(
                                    child: RichText(
                                      overflow: TextOverflow.ellipsis,
                                      maxLines: 2,
                                      text: TextSpan(
                                        text: e.name,
                                        style: AppFonts.smallBoldBlackTwoTextStyle,
                                        children: [
                                          TextSpan(
                                            text: colonString,
                                            style: AppFonts.smallBoldBlackTwoTextStyle,
                                          ),
                                          TextSpan(
                                            text: spaceString,
                                            style: AppFonts.smallTextStyle,
                                          ),
                                          TextSpan(
                                            text: e.description,
                                            style: AppFonts.smallTextStyle,
                                          ),
                                          TextSpan(
                                            text: spaceString,
                                            style: AppFonts.smallTextStyle,
                                          ),
                                          TextSpan(
                                            text: e.count,
                                            style: AppFonts.smallTextStyle,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              );
                            }).toList(),
                          ),
                        ),
                      ],
                    )
                  : Container(
                      margin: const EdgeInsets.fromLTRB(
                        26.0,
                        12.0,
                        16.0,
                        9.0,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 54.0,
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Expanded(
                                  child: RichText(
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 2,
                                    text: TextSpan(
                                      text: widget.recipe.name,
                                      style: AppFonts.mediumShadowBlackTextStyle,
                                    ),
                                  ),
                                ),
                                (widget.recipe.isFavorite && widget.needFavoriteIcon)
                                    ? InkWell(
                                        child: Icon(
                                          Icons.favorite,
                                          color: AppColors.pastelRed,
                                          size: 22.0,
                                        ),
                                        onTap: () {
                                          DialogService.instance.show(
                                            dialog: RemoveFavouriteDialog(
                                              child: RemoveFavouriteDialogWidget(
                                                onTapYes: () {
                                                  /*FavoritePageSelector.removeFromFavorite(
                                                    store: StoreProvider.of<AppState>(context),
                                                    recipeId: widget.recipe.i,
                                                  );*/
                                                },
                                              ),
                                            ),
                                          );
                                        },
                                      )
                                    : const SizedBox(),
                              ],
                            ),
                          ),
                          _missingIngredients.isEmpty ? _getParameterOfRecipeWidgetBlock() : _geMissingIngredientsBock(),
                        ],
                      ),
                    ),
            ),
            _getImage(),
          ],
        ),
      ),
    );
  }

  Widget _getImage() {
    final double widthScreen = MediaQuery.of(context).size.width;
    return ClipRRect(
      borderRadius: _focusNode.hasFocus
          ? BorderRadius.only(
              topLeft: Radius.circular(10.0),
              topRight: Radius.circular(10.0),
            )
          : BorderRadius.circular(10.0),
      child: SizedBox(
        height: 128.0,
        width: _focusNode.hasFocus ? widthScreen : 128.0,
        child: Stack(
          fit: StackFit.expand,
          alignment: FlutterDictionary.instance.isRTL ? Alignment.topRight : Alignment.topLeft,
          children: [
            Container(
              color: AppColors.white,
              child: widget.recipe.image == null
                  ? FittedBox(
                      fit: BoxFit.fitHeight,
                      child: Image.asset(
                        ImageAssets.recipeElementMan,
                      ),
                    )
                  : CachedNetworkImage(
                      imageUrl: widget.recipe.image!,
                      fit: _focusNode.hasFocus ? BoxFit.fitWidth : BoxFit.fitHeight,
                      imageBuilder: (BuildContext _, ImageProvider imageProvider) {
                        return Image(
                          image: imageProvider,
                          fit: _focusNode.hasFocus ? BoxFit.fitWidth : BoxFit.fitHeight,
                        );
                      },
                      placeholder: (context, url) => SizedBox(
                        child: Image.asset(ImageAssets.chefYellow),
                      ),
                      errorWidget: (context, url, error) {
                        return Image.asset(
                          ImageAssets.recipeElementMan,
                        );
                      },
                    ),
            ),
            _focusNode.hasFocus
                ? Positioned(
                    top: 0.0,
                    left: 0.0,
                    child: Container(
                      width: widthScreen - 25.0,
                      padding: const EdgeInsets.all(10.0),
                      child: Text(
                        widget.recipe.name,
                        style: AppFonts.mediumWhiteTextStyle,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  )
                : const SizedBox(),
            _focusNode.hasFocus
                ? Positioned(
                    bottom: 0.0,
                    child: Container(
                      margin: const EdgeInsets.all(10.0),
                      child: Row(
                        children: [
                          _getParameterOfRecipeWidget(
                            imageAssets: ImageAssets.timeIcon,
                            value: widget.recipe.time.toString(),
                            text: language!.min,
                            textStyle: AppFonts.smallWhiteTextStyle,
                          ),
                          _getParameterOfRecipeWidget(
                            imageAssets: ImageAssets.caloriesIcon,
                            value: widget.recipe.calories.toStringAsFixed(1),
                            text: language!.cal,
                            textStyle: AppFonts.smallWhiteTextStyle,
                          ),
                          widget.recipe.level == null
                              ? const SizedBox()
                              : _getParameterOfRecipeWidget(
                                  imageAssets: ImageAssets.difficultyIcon,
                                  value: widget.recipe.level,
                                  textStyle: AppFonts.smallWhiteTextStyle,
                                ),
                        ],
                      ),
                    ),
                  )
                : _missingIngredients.isEmpty
                    ? const SizedBox()
                    : Positioned(
                        bottom: 0.0,
                        child: Container(
                          margin: const EdgeInsets.all(10.0),
                          child: _getParameterOfRecipeWidget(
                            imageAssets: ImageAssets.timeIcon,
                            value: widget.recipe.time.toString(),
                            text: language!.min,
                            textStyle: AppFonts.smallWhiteTextStyle,
                          ),
                        ),
                      ),
            _focusNode.hasFocus
                ? Positioned(
                    bottom: 0.0,
                    left: FlutterDictionary.instance.isRTL ? 0.0 : null,
                    right: FlutterDictionary.instance.isRTL ? null : 0.0,
                    child: InkWell(
                      child: Container(
                        height: 28.0,
                        width: 28.0,
                        margin: const EdgeInsets.all(10.0),
                        decoration: BoxDecoration(
                          color: AppColors.white,
                          shape: BoxShape.circle,
                        ),
                        child: Icon(
                          Icons.keyboard_arrow_up,
                          size: 24.0,
                        ),
                      ),
                      onTap: () => setState(() {
                        if (FocusManager.instance.primaryFocus != null) FocusManager.instance.primaryFocus!.unfocus();
                      }),
                    ),
                  )
                : const SizedBox(),
          ],
        ),
      ),
    );
  }

  Widget _geMissingIngredientsBock() {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            language!.youDoNotHave,
            style: AppFonts.smallPaselRed16TextStyle,
          ),
          SizedBox(
            height: 35.0,
            child: Row(
              children: [
                Flexible(
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: _missingIngredients.map((e) {
                      return Container(
                        height: 32.0,
                        width: 32.0,
                        margin: const EdgeInsets.symmetric(horizontal: 3.0),
                        child: IngredientImageCacheManager.instance.getImageWithIdIngredient(ingredient: e) ??
                            CachedNetworkImage(
                              imageUrl: e.image!,
                              imageBuilder: (BuildContext _, ImageProvider imageProvider) {
                                return Image(image: imageProvider);
                              },
                              placeholder: (context, url) => SizedBox(
                                width: baseHeightOfIngredientElement,
                                child: Image.asset(ImageAssets.chefYellow),
                              ),
                              errorWidget: (context, url, error) {
                                return Image.asset(ImageAssets.chefYellow);
                              },
                            ),
                      );
                    }).toList(),
                  ),
                ),
                widget.needOpenFunction
                    ? Container(
                        margin: EdgeInsets.only(
                          left: FlutterDictionary.instance.isRTL ? 0.0 : 10.0,
                          right: FlutterDictionary.instance.isRTL ? 10.0 : 0.0,
                          bottom: 10.0,
                        ),
                        child: InkWell(
                          child: Icon(
                            Icons.keyboard_arrow_down,
                            size: 24.0,
                          ),
                          onTap: () {
                            setState(() {
                              FocusScope.of(RouteService.instance.navigatorKey.currentState!.context).requestFocus(_focusNode);
                            });
                          },
                        ),
                      )
                    : const SizedBox(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _getParameterOfRecipeWidgetBlock() {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _getParameterOfRecipeWidget(
            imageAssets: ImageAssets.caloriesIcon,
            value: widget.recipe.calories.toStringAsFixed(1),
            text: language!.cal,
            textStyle: AppFonts.smallTextStyle,
          ),
          widget.recipe.level == null
              ? _getParameterOfRecipeWidget(
                  imageAssets: ImageAssets.timeIcon,
                  value: widget.recipe.time.toString(),
                  text: language!.min,
                  textStyle: AppFonts.smallTextStyle,
                )
              : Expanded(
                  child: Row(
                    children: [
                      _getParameterOfRecipeWidget(
                        imageAssets: ImageAssets.timeIcon,
                        value: widget.recipe.time.toString(),
                        text: language!.min,
                        textStyle: AppFonts.smallTextStyle,
                      ),
                      _getParameterOfRecipeWidget(
                        imageAssets: ImageAssets.difficultyIcon,
                        value: widget.recipe.level,
                        textStyle: AppFonts.smallTextStyle,
                      ),
                    ],
                  ),
                ),
        ],
      ),
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
      height: 20.0,
      width: 80.0,
      child: Row(
        textDirection: FlutterDictionary.instance.isRTL ? TextDirection.rtl : TextDirection.ltr,
        mainAxisSize: MainAxisSize.min,
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
              maxLines: 1,
            ),
          ),
          text == null
              ? const SizedBox()
              : Flexible(
                  child: Text(
                    text,
                    style: textStyle,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                  ),
                ),
        ],
      ),
    );
  }
}
