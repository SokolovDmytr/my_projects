import 'package:flutter/material.dart';
import 'package:fridge_yellow_team_bloc/dictionary/dictionary_classes/main_page_language.dart';
import 'package:fridge_yellow_team_bloc/dictionary/flutter_dictionary.dart';
import 'package:fridge_yellow_team_bloc/res/app_fonts.dart';
import 'package:fridge_yellow_team_bloc/res/app_styles/app_colors.dart';
import 'package:fridge_yellow_team_bloc/res/app_styles/app_gradient.dart';
import 'package:fridge_yellow_team_bloc/res/app_styles/app_shadows.dart';
import 'package:fridge_yellow_team_bloc/res/image_assets.dart';
import 'package:fridge_yellow_team_bloc/ui/global_widgets/global_button.dart';

class SwipeTutorialWidget extends StatelessWidget {
  final void Function() onTapOk;
  final MainPageLanguage language = FlutterDictionary.instance.language.mainPageLanguage;

  SwipeTutorialWidget({
    required this.onTapOk,
  }) : super(key: UniqueKey());

  @override
  Widget build(BuildContext context) {
    return Dialog(
      insetPadding: const EdgeInsets.only(),
      backgroundColor: AppColors.transparent,
      child: Container(
        margin: const EdgeInsets.only(left: 32.0, right: 32.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              margin: const EdgeInsets.only(bottom: 8.0),
              alignment: Alignment.center,
              child: Text(
                language.swipeTutorial,
                style: AppFonts.normalWhiteHeight30TextStyle,
                maxLines: 2,
                textAlign: TextAlign.center,
                softWrap: true,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            Flexible(
              child: Image.asset(ImageAssets.swipeTutorial),
            ),
            Container(
              margin: const EdgeInsets.only(top: 20.0),
              child: GlobalButton(
                key: UniqueKey(),
                text: language.buttonOk,
                height: 56.0,
                fontText: AppFonts.normalMediumTextStyle,
                gradient: AppGradient.wheatMarigoldGradient,
                shadows: AppShadows.buttonOcreShadow,
                onTap: onTapOk,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
