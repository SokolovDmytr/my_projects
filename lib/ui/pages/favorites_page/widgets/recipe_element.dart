import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fridge_yellow_team_bloc/application/bloc/ingridients_bloc/ingredients_bloc.dart';
import 'package:fridge_yellow_team_bloc/application/bloc/language_bloc/language_bloc.dart';
import 'package:fridge_yellow_team_bloc/application/bloc/language_bloc/language_state.dart';
import 'package:fridge_yellow_team_bloc/application/bloc/recipes_bloc/recipes_bloc.dart';
import 'package:fridge_yellow_team_bloc/application/bloc/recipes_bloc/recipes_event.dart';
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
import 'package:fridge_yellow_team_bloc/services/dialog_service/dialog_service.dart';
import 'package:fridge_yellow_team_bloc/services/dialog_service/dialogs/remove_favourite_dialog/remove_favourite_dialog.dart';
import 'package:fridge_yellow_team_bloc/services/dialog_service/dialogs/remove_favourite_dialog/remove_favourite_widget.dart';
import 'package:fridge_yellow_team_bloc/services/route_service/route_service.dart';
import 'package:fridge_yellow_team_bloc/ui/global_widgets/custom_network_image.dart';
import 'package:fridge_yellow_team_bloc/utils/comparator.dart';

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
  final FavouritesPageLanguage _language = FlutterDictionary.instance.language.favouritesPageLanguage;
  final FocusNode _focusNode = FocusNode();
  List<Ingredient>? _missingIngredients;
  bool _needUpdateMissingIngredients = true;

  @override
  void initState() {
    super.initState();
    _focusNode.addListener(() {
      if (!_focusNode.hasFocus) {
        setState(() {});
      }
    });
  }

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (_needUpdateMissingIngredients) {
      _missingIngredients = CustomComparator.getMissingIngredients(
        recipe: widget.recipe,
        ingredients: context.read<IngredientsBloc>().state.ingredients,
      );
      _needUpdateMissingIngredients = false;
    }
    return BlocListener<LanguageBloc, LanguageState>(
      listener: (
        BuildContext _,
        LanguageState __,
      ) {
        _needUpdateMissingIngredients = true;
      },
      child: AnimatedSize(
        duration: AppDuration.recipeOpenDuration,
        vsync: this,
        child: Container(
          decoration: BoxDecoration(
            boxShadow: AppShadows.recipeElementShadow,
          ),
          child: Stack(
            textDirection: FlutterDictionary.instance.isRTL ? TextDirection.rtl : TextDirection.ltr,
            children: [
              Container(
                height: _focusNode.hasFocus ? 168.0 : 128.0,
                margin: EdgeInsetsDirectional.only(
                  start: _focusNode.hasFocus ? 0.0 : 118.0,
                  top: _focusNode.hasFocus ? 126.0 : 0.0,
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
                    color: _missingIngredients!.isEmpty ? AppColors.white : AppColors.pastelRed,
                  ),
                ),
                child: _focusNode.hasFocus
                    ? Column(
                        children: [
                          Container(
                            margin: const EdgeInsets.all(10.0),
                            alignment: FlutterDictionary.instance.isRTL ? Alignment.centerRight : Alignment.centerLeft,
                            child: Text(
                              _language.youDoNotHave,
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
                              children: _missingIngredients!.map((e) {
                                return Row(
                                  key: ValueKey(e.i),
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Container(
                                      height: 32.0,
                                      width: 32.0,
                                      margin: const EdgeInsets.symmetric(horizontal: 3.0),
                                      child: CustomNetworkImage(
                                        url: e.image,
                                        placeholder: Image.asset(
                                          ImageAssets.chefYellow,
                                        ),
                                        fit: BoxFit.contain,
                                        errorFit: BoxFit.contain,
                                      ),
                                    ),
                                    Flexible(
                                      child: RichText(
                                        overflow: TextOverflow.ellipsis,
                                        textDirection: FlutterDictionary.instance.isRTL ? TextDirection.rtl : TextDirection.ltr,
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
                                              text: e.count,
                                              style: AppFonts.smallTextStyle,
                                            ),
                                            TextSpan(
                                              text: spaceString,
                                              style: AppFonts.smallTextStyle,
                                            ),
                                            TextSpan(
                                              text: e.description,
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
                        margin: EdgeInsetsDirectional.only(
                          start: 26.0,
                          end: 16.0,
                          bottom: 9.0,
                          top: 12.0,
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
                                      textAlign: FlutterDictionary.instance.isRTL ? TextAlign.right : TextAlign.left,
                                      maxLines: 2,
                                      text: TextSpan(
                                        text: widget.recipe.name,
                                        style: AppFonts.mediumShadowBlackTextStyle,
                                      ),
                                    ),
                                  ),
                                  (widget.recipe.isFavorite && widget.needFavoriteIcon)
                                      ? InkWell(
                                          onTap: () {
                                            DialogService.instance.show(
                                              dialog: RemoveFavouriteDialog(
                                                child: RemoveFavouriteDialogWidget(
                                                  onTapYes: () {
                                                    context.read<RecipesBloc>().add(
                                                          RemoveFavouriteRecipeEvent(
                                                            recipe: widget.recipe,
                                                          ),
                                                        );
                                                  },
                                                ),
                                              ),
                                            );
                                          },
                                          child: Icon(
                                            Icons.favorite,
                                            color: AppColors.pastelRed,
                                            size: 22.0,
                                          ),
                                        )
                                      : const SizedBox(),
                                ],
                              ),
                            ),
                            _missingIngredients!.isEmpty ? _getParameterOfRecipeWidgetBlock() : _getMissingIngredientsBlock(),
                          ],
                        ),
                      ),
              ),
              _getImage(),
            ],
          ),
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
              child: CustomNetworkImage(
                url: widget.recipe.image,
                placeholder: Image.asset(ImageAssets.chefYellow),
                fit: _focusNode.hasFocus ? BoxFit.fitWidth : BoxFit.fitHeight,
                errorFit: BoxFit.contain,
              ),
            ),
            _focusNode.hasFocus
                ? Positioned(
                    top: 0.0,
                    left: 0.0,
                    child: Container(
                      width: widthScreen - 25.0,
                      padding: const EdgeInsets.all(10.0),
                      alignment: FlutterDictionary.instance.isRTL ? Alignment.centerRight : Alignment.centerLeft,
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
                            text: _language.min,
                            textStyle: AppFonts.smallWhiteTextStyle,
                          ),
                          _getParameterOfRecipeWidget(
                            imageAssets: ImageAssets.caloriesIcon,
                            value: widget.recipe.calories.toStringAsFixed(1),
                            text: _language.cal,
                            textStyle: AppFonts.smallWhiteTextStyle,
                          ),
                          widget.recipe.level == null
                              ? const SizedBox()
                              : _getParameterOfRecipeWidget(
                                  imageAssets: ImageAssets.difficultyIcon,
                                  value: widget.recipe.level!,
                                  textStyle: AppFonts.smallWhiteTextStyle,
                                ),
                        ],
                      ),
                    ),
                  )
                : _missingIngredients!.isEmpty
                    ? const SizedBox()
                    : Positioned(
                        bottom: 0.0,
                        child: Container(
                          margin: const EdgeInsets.all(10.0),
                          child: _getParameterOfRecipeWidget(
                            imageAssets: ImageAssets.timeIcon,
                            value: widget.recipe.time.toString(),
                            text: _language.min,
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
                      onTap: () => setState(() {
                        FocusManager.instance.primaryFocus!.unfocus();
                      }),
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
                    ),
                  )
                : const SizedBox(),
          ],
        ),
      ),
    );
  }

  Widget _getMissingIngredientsBlock() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          _language.youDoNotHave,
          style: AppFonts.smallPaselRed16TextStyle,
        ),
        SizedBox(
          height: 35.0,
          child: Row(
            children: [
              Flexible(
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: _missingIngredients!.map((e) {
                    return Container(
                      height: 32.0,
                      width: 32.0,
                      margin: const EdgeInsets.symmetric(horizontal: 3.0),
                      child: CustomNetworkImage(
                        url: e.image,
                        placeholder: Image.asset(ImageAssets.chefYellow),
                        fit: BoxFit.contain,
                        errorFit: BoxFit.contain,
                      ),
                    );
                  }).toList(),
                ),
              ),
              widget.needOpenFunction
                  ? Container(
                      margin: EdgeInsetsDirectional.only(
                        start: 10.0,
                        bottom: 10.0,
                      ),
                      child: InkWell(
                        onTap: () {
                          setState(() {
                            FocusScope.of(RouteService.instance.navigatorKey.currentState!.context).requestFocus(_focusNode);
                          });
                        },
                        child: Icon(
                          Icons.keyboard_arrow_down,
                          size: 24.0,
                        ),
                      ),
                    )
                  : const SizedBox(),
            ],
          ),
        ),
      ],
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
            text: _language.cal,
            textStyle: AppFonts.smallTextStyle,
          ),
          widget.recipe.level == null
              ? _getParameterOfRecipeWidget(
                  imageAssets: ImageAssets.timeIcon,
                  value: widget.recipe.time.toString(),
                  text: _language.min,
                  textStyle: AppFonts.smallTextStyle,
                )
              : Expanded(
                  child: Row(
                    children: [
                      _getParameterOfRecipeWidget(
                        imageAssets: ImageAssets.timeIcon,
                        value: widget.recipe.time.toString(),
                        text: _language.min,
                        textStyle: AppFonts.smallTextStyle,
                      ),
                      _getParameterOfRecipeWidget(
                        imageAssets: ImageAssets.difficultyIcon,
                        value: widget.recipe.level!,
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
