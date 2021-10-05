import 'package:flutter/material.dart';
import 'package:yellow_team_fridge/dictionary/data/en.dart';
import 'package:yellow_team_fridge/dictionary/dictionary_classes/favorites_page_language.dart';
import 'package:yellow_team_fridge/dictionary/flutter_dictionary.dart';
import 'package:yellow_team_fridge/models/pages/recipe.dart';
import 'package:yellow_team_fridge/res/app_duration.dart';
import 'package:yellow_team_fridge/res/app_fonts.dart';
import 'package:yellow_team_fridge/res/app_styles/app_colors.dart';
import 'package:yellow_team_fridge/res/app_styles/app_shadows.dart';
import 'package:yellow_team_fridge/res/image_assets.dart';

class RecipeElement extends StatefulWidget {
  final Recipe recipe;
  final bool isOpen;
  final Function(String) openCard;

  const RecipeElement({
    @required this.recipe,
    @required this.isOpen,
    @required this.openCard,
    Key key,
  }) : super(key: key);

  @override
  _RecipeElementState createState() => _RecipeElementState();
}

class _RecipeElementState extends State<RecipeElement> with TickerProviderStateMixin {
  final FavouritesPageLanguage language = FlutterDictionary.instance.language?.favouritesPageLanguage ?? en.favouritesPageLanguage;

  @override
  Widget build(BuildContext context) {
    return AnimatedSize(
      duration: AppDuration.recipeOpenDuration,
      vsync: this,
      child: InkWell(
        // onTap: () {
        //   widget.openCard.call(widget.recipe.i.toString());
        // },
        child: Container(
          height: widget.isOpen ? 150.0 : 128.0,
          margin: const EdgeInsets.symmetric(vertical: 8.0),
          decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.circular(10.0),
            boxShadow: AppShadows.recipeElementShadow,
          ),
          child: widget.isOpen
              ? Column(
                  children: [
                    _getImage(),
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
                                  Icon(
                                    Icons.favorite,
                                    color: AppColors.pastelRed,
                                    size: 22.0,
                                  ),
                                ],
                              ),
                            ),
                            _getParameterOfRecipeWidget(
                              imageAssets: ImageAssets.caloriesIcon,
                              value: widget.recipe.calories.toStringAsFixed(1),
                              text: language.cal,
                            ),
                            widget.recipe.level == null
                                ? _getParameterOfRecipeWidget(
                                    imageAssets: ImageAssets.timeIcon,
                                    value: widget.recipe.time.toString(),
                                    text: language.min,
                                  )
                                : Expanded(
                                    child: Row(
                                      children: [
                                        _getParameterOfRecipeWidget(
                                          imageAssets: ImageAssets.timeIcon,
                                          value: widget.recipe.time.toString(),
                                          text: language.min,
                                        ),
                                        _getParameterOfRecipeWidget(
                                          imageAssets: ImageAssets.difficultyIcon,
                                          value: widget.recipe.level,
                                        ),
                                      ],
                                    ),
                                  ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
        ),
      ),
    );
  }

  Widget _getImage() {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10.0),
      child: SizedBox(
        height: 128.0,
        width: widget.isOpen ? double.infinity : 128.0,
        child: widget.recipe.image == null
            ? Image.asset(
                ImageAssets.favoriteChef,
              )
            : Image.network(
                widget.recipe.image,
                fit: widget.isOpen ? BoxFit.contain : BoxFit.fitHeight,
              ),
      ),
    );
  }

  Widget _getParameterOfRecipeWidget({@required String imageAssets, String text, String value}) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 2.0),
      height: 20.0,
      width: 80.0,
      child: Row(
        textDirection: FlutterDictionary.instance.isRTL ? TextDirection.rtl : TextDirection.ltr,
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(imageAssets),
          Flexible(
            child: Container(
              margin: const EdgeInsets.only(
                left: 4.0,
                right: 4.0,
              ),
              child: Text(
                value,
                style: AppFonts.smallTextStyle,
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
              ),
            ),
          ),
          text == null
              ? const SizedBox()
              : Text(
                  text,
                  style: AppFonts.smallTextStyle,
                ),
        ],
      ),
    );
  }
}
