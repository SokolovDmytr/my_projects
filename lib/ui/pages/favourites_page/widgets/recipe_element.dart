import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:yellow_team_fridge/dictionary/data/en.dart';
import 'package:yellow_team_fridge/dictionary/dictionary_classes/favorites_page_language.dart';
import 'package:yellow_team_fridge/dictionary/flutter_dictionary.dart';
import 'package:yellow_team_fridge/models/pages/ingredient.dart';
import 'package:yellow_team_fridge/models/pages/recipe.dart';
import 'package:yellow_team_fridge/res/app_duration.dart';
import 'package:yellow_team_fridge/res/app_fonts.dart';
import 'package:yellow_team_fridge/res/app_styles/app_colors.dart';
import 'package:yellow_team_fridge/res/app_styles/app_shadows.dart';
import 'package:yellow_team_fridge/res/const.dart';
import 'package:yellow_team_fridge/res/image_assets.dart';
import 'package:yellow_team_fridge/services/route_service/route_service.dart';
import 'package:yellow_team_fridge/store/application/app_state.dart';
import 'package:yellow_team_fridge/utils/comparator.dart';

class RecipeElement extends StatefulWidget {
  final Recipe recipe;
  final bool needOpenFunction;
  List<Ingredient> _missingIngredients = [];

  RecipeElement({
    @required this.recipe,
    @required this.needOpenFunction,
    Key key,
  }) : super(key: key);

  @override
  _RecipeElementState createState() => _RecipeElementState();
}

class _RecipeElementState extends State<RecipeElement> with TickerProviderStateMixin {
  final FavouritesPageLanguage language = FlutterDictionary.instance.language?.favouritesPageLanguage ?? en.favouritesPageLanguage;
  final FocusNode _focusNode = FocusNode();

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
  Widget build(BuildContext context) {
    if(widget._missingIngredients.isEmpty){
      widget._missingIngredients = CustomComparator.getMissingsIngredients(
        recipe: widget.recipe,
        ingredients: StoreProvider.of<AppState>(context).state.homePageState.ingredients,
      );
    }

    return AnimatedSize(
      duration: AppDuration.recipeOpenDuration,
      vsync: this,
      child: Container(
        height: _focusNode.hasFocus ? 250.0 : 130.0,
        margin: const EdgeInsets.symmetric(vertical: 8.0),
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(10.0),
          boxShadow: AppShadows.recipeElementShadow,
          border: Border.all(
            color: widget._missingIngredients.isEmpty ? AppColors.white : AppColors.pastelRed,
          ),
        ),
        child: _focusNode.hasFocus
            ? Column(
                children: [
                  _getImage(),
                  Container(
                    margin: const EdgeInsets.all(10.0),
                    alignment: Alignment.centerLeft,
                    child: Text(
                      language.youDoNotHave,
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
                      children: widget._missingIngredients.map((e) {
                        return Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Container(
                              margin: const EdgeInsets.symmetric(horizontal: 3.0),
                              child: Image.network(
                                e.image,
                                width: 32.0,
                                height: 32.0,
                                errorBuilder: (BuildContext _, Object __, StackTrace ___) {
                                  return Icon(
                                    Icons.error,
                                    color: AppColors.pastelRed,
                                  );
                                },
                              ),
                            ),
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
            : Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  _getImage(),
                  Expanded(
                    child: Container(
                      margin: const EdgeInsets.fromLTRB(
                        16.0,
                        14.0,
                        16.0,
                        9.0,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            height: 46.0,
                            margin: const EdgeInsets.only(bottom: 8.0),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Flexible(
                                  child: RichText(
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 2,
                                    text: TextSpan(
                                      text: widget.recipe.name,
                                      style: AppFonts.mediumShadowBlackTextStyle,
                                    ),
                                  ),
                                ),
                                widget.recipe.isFavorite
                                    ? Icon(
                                        Icons.favorite,
                                        color: AppColors.pastelRed,
                                        size: 22.0,
                                      )
                                    : const SizedBox(),
                              ],
                            ),
                          ),
                          widget._missingIngredients.isEmpty ? _getParameterOfRecipeWidgetBock() : _geMissingIngredientsBock(),
                        ],
                      ),
                    ),
                  )
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
            widget.recipe.image == null
                ? Image.asset(
                    ImageAssets.chefYellow,
                  )
                : Image.network(
                    widget.recipe.image,
                    fit: _focusNode.hasFocus ? BoxFit.fitWidth : BoxFit.fitHeight,
                    errorBuilder: (BuildContext _, Object __, StackTrace ___) {
                      return Image.asset(
                        ImageAssets.chefYellow,
                      );
                    },
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
                            text: language.min,
                            textStyle: AppFonts.smallWhiteTextStyle,
                          ),
                          _getParameterOfRecipeWidget(
                            imageAssets: ImageAssets.caloriesIcon,
                            value: widget.recipe.calories.toStringAsFixed(1),
                            text: language.cal,
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
                : widget._missingIngredients.isEmpty
                    ? const SizedBox()
                    : Positioned(
                        bottom: 0.0,
                        child: Container(
                          margin: const EdgeInsets.all(10.0),
                          child: _getParameterOfRecipeWidget(
                            imageAssets: ImageAssets.timeIcon,
                            value: widget.recipe.time.toString(),
                            text: language.min,
                            textStyle: AppFonts.smallWhiteTextStyle,
                          ),
                        ),
                      ),

            _focusNode.hasFocus ? Positioned(
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
                onTap: () {
                  setState(() {
                    FocusManager.instance.primaryFocus.unfocus();
                  });
                },
              ),
            ) : const SizedBox(),
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
            language.youDoNotHave,
            style: AppFonts.smallPaselRed16TextStyle,
          ),
          SizedBox(
            height: 35.0,
            child: Row(
              children: [
                Flexible(
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: widget._missingIngredients.map((e) {
                      return Container(
                        height: 32.0,
                        width: 32.0,
                        margin: const EdgeInsets.symmetric(horizontal: 3.0),
                        child: Image.network(
                          e.image,
                          errorBuilder: (BuildContext _, Object __, StackTrace ___) {
                            return Icon(
                              Icons.error,
                              color: AppColors.pastelRed,
                            );
                          },
                        ),
                      );
                    }).toList(),
                  ),
                ),
                widget.needOpenFunction ? Container(
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
                        FocusScope.of(RouteService.instance.navigatorKey.currentState.context).requestFocus(_focusNode);
                      });
                    },
                  ),
                ) : const SizedBox(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _getParameterOfRecipeWidgetBock() {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _getParameterOfRecipeWidget(
            imageAssets: ImageAssets.caloriesIcon,
            value: widget.recipe.calories.toStringAsFixed(1),
            text: language.cal,
            textStyle: AppFonts.smallTextStyle,
          ),
          widget.recipe.level == null
              ? _getParameterOfRecipeWidget(
                  imageAssets: ImageAssets.timeIcon,
                  value: widget.recipe.time.toString(),
                  text: language.min,
                  textStyle: AppFonts.smallTextStyle,
                )
              : Expanded(
                  child: Row(
                    children: [
                      _getParameterOfRecipeWidget(
                        imageAssets: ImageAssets.timeIcon,
                        value: widget.recipe.time.toString(),
                        text: language.min,
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

  Widget _getParameterOfRecipeWidget(
      {@required String imageAssets,
      @required TextStyle textStyle,
      String text,
      String value}) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 2.0),
      height: 20.0,
      width: 80.0,
      child: Row(
        textDirection: FlutterDictionary.instance.isRTL
            ? TextDirection.rtl
            : TextDirection.ltr,
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
