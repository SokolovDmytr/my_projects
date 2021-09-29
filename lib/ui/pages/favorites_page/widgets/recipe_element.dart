import 'package:flutter/material.dart';
import 'package:yellow_team_fridge/dictionary/data/en.dart';
import 'package:yellow_team_fridge/dictionary/dictionary_classes/favorites_page_language.dart';
import 'package:yellow_team_fridge/dictionary/flutter_dictionary.dart';
import 'package:yellow_team_fridge/models/pages/recipe.dart';
import 'package:yellow_team_fridge/res/app_duration.dart';
import 'package:yellow_team_fridge/res/app_styles/app_colors.dart';
import 'package:yellow_team_fridge/res/app_styles/app_shadows.dart';
import 'package:yellow_team_fridge/res/image_assets.dart';

class RecipeElement extends StatefulWidget {
  final Recipe recipe;

  final FocusNode _focusNode;

  RecipeElement({
    @required this.recipe,
    Key key,
  })  : _focusNode = FocusNode(),
        super(key: key);

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
      child: Container(
        height: widget._focusNode.hasFocus ? 150.0 : 128.0,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          boxShadow: AppShadows.recipeElementShadow,
          border: Border.all(
            color: (widget.recipe.ingredients == null || widget.recipe.ingredients.isEmpty) ? AppColors.white : AppColors.pastelRed,
          ),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10.0),
          child: Container(
            height: 128.0,
            width: 128.0,
            child: widget.recipe.image == null ? Image.asset(ImageAssets.favoriteChef) : Image.network(widget.recipe.image),
          ),
        )
      ),
    );
  }
}
