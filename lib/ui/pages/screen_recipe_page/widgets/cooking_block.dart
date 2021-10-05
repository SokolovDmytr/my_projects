import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:yellow_team_fridge/models/pages/recipe.dart';
import 'package:yellow_team_fridge/res/app_fonts.dart';
import 'package:yellow_team_fridge/res/app_styles/app_colors.dart';
import 'package:yellow_team_fridge/res/image_assets.dart';

class CookingBlock extends StatelessWidget {
  final Recipe recipe;

  const CookingBlock({
    @required this.recipe,
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: _buildSteps(),
    );
  }

  List<Widget> _buildSteps() {
    List<Widget> steps = [
      Row(
        children: [
          Image.asset(
            ImageAssets.pot,
            width: 24.0,
            height: 24.0,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: Text(
              'Cooking:',
              style: AppFonts.mediumTextStyle,
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
                margin: const EdgeInsets.only(right: 7.0),
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
