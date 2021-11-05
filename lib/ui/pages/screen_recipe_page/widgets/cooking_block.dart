import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fridge_yellow_team_bloc/dictionary/data/en.dart';
import 'package:fridge_yellow_team_bloc/dictionary/dictionary_classes/screen_recipe_language.dart';
import 'package:fridge_yellow_team_bloc/dictionary/flutter_dictionary.dart';
import 'package:fridge_yellow_team_bloc/models/pages/freezed/recipe.dart';
import 'package:fridge_yellow_team_bloc/res/app_fonts.dart';
import 'package:fridge_yellow_team_bloc/res/app_styles/app_colors.dart';
import 'package:fridge_yellow_team_bloc/res/image_assets.dart';

class CookingBlock extends StatelessWidget {
  final Recipe recipe;

  const CookingBlock({
    required this.recipe,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 72.0),
      child: Column(
        children: _buildSteps(),
      ),
    );
  }

  List<Widget> _buildSteps() {
    final ScreenRecipeLanguage _language = FlutterDictionary.instance.language?.screenRecipeLanguage ?? en.screenRecipeLanguage;
    final List<Widget> steps = [
      Row(
        children: [
          Image.asset(
            ImageAssets.pot,
            width: 24.0,
            height: 24.0,
          ),
          Padding(
            padding: FlutterDictionary.instance.isRTL ? const EdgeInsets.only(right: 8.0) : const EdgeInsets.only(left: 8.0),
            child: Text(
              _language.cooking,
              style: AppFonts.mediumTextStyleBlackTwo,
            ),
          ),
        ],
      ),
    ];
    for (int index = 0; index < recipe.steps.length; index++) {
      steps.add(
        Padding(
          padding: const EdgeInsets.only(top: 19.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                margin: FlutterDictionary.instance.isRTL ? const EdgeInsets.only(left: 7.0) : const EdgeInsets.only(right: 7.0),
                width: 30.0,
                height: 30.0,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: AppColors.black,
                  ),
                ),
                child: Align(
                  child: Text(
                    '${index + 1}',
                    style: AppFonts.medium16Height24TextStyle,
                  ),
                ),
              ),
              Expanded(
                child: Text(
                  '${recipe.steps[index]}',
                  style: AppFonts.medium16Height24TextStyle,
                  overflow: TextOverflow.visible,
                  textAlign: FlutterDictionary.instance.isRTL ? TextAlign.right : TextAlign.left,
                ),
              ),
            ],
          ),
        ),
      );
    }
    return steps;
  }
}
