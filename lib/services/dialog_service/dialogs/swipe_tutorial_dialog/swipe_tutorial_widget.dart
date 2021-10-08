import 'package:flutter/material.dart';
import 'package:yellow_team_fridge/dictionary/dictionary_classes/main_page_language.dart';
import 'package:yellow_team_fridge/dictionary/flutter_dictionary.dart';
import 'package:yellow_team_fridge/dictionary/data/en.dart';
import 'package:yellow_team_fridge/res/app_fonts.dart';
import 'package:yellow_team_fridge/res/app_styles/app_colors.dart';
import 'package:yellow_team_fridge/res/app_styles/app_gradient.dart';
import 'package:yellow_team_fridge/res/app_styles/app_shadows.dart';
import 'package:yellow_team_fridge/res/image_assets.dart';
import 'package:yellow_team_fridge/ui/global_widgets/global_button.dart';

class SwipeTutorialWidget extends StatelessWidget {
  final Function onTapOk;
  final MainPageLanguage language = FlutterDictionary.instance.language?.mainPageLanguage ?? en.mainPageLanguage;

  SwipeTutorialWidget({
    @required this.onTapOk,
  }) : super(
          key: Key(
            'SwipeTutorialWidget',
          ),
        );

  @override
  Widget build(BuildContext context) {
    return Dialog(
      insetPadding: EdgeInsets.zero,
      backgroundColor: AppColors.transparent,
      child: Container(
        margin: const EdgeInsets.fromLTRB(32.0, 190.0, 32.0, 200.0),
        child: Column(
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
                key: Key('SwipeTutorialGlobalButton'),
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
