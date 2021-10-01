import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:yellow_team_fridge/dictionary/data/en.dart';
import 'package:yellow_team_fridge/dictionary/dictionary_classes/settings_page_language.dart';
import 'package:yellow_team_fridge/dictionary/flutter_dictionary.dart';
import 'package:yellow_team_fridge/res/app_fonts.dart';
import 'package:yellow_team_fridge/res/app_styles/app_colors.dart';
import 'package:yellow_team_fridge/res/app_styles/app_gradient.dart';
import 'package:yellow_team_fridge/res/image_assets.dart';
import 'package:yellow_team_fridge/ui/pages/screen_recipe_page/widgets/congratulation_block.dart';

class ScreenRecipesPage extends StatelessWidget {
  const ScreenRecipesPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final SettingsPageLanguage _language =
        FlutterDictionary.instance.language?.settingsPageLanguage ?? en.settingsPageLanguage;
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.white,
        body: SingleChildScrollView(
          child: Stack(
            children: [
              Container(
                height: 312.0,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  gradient: AppGradient.black30black0,
                ),
              ),
              Container(
                margin: const EdgeInsets.only(bottom: 13.0),
                child: InkWell(
                  child: Row(
                    textDirection: FlutterDictionary.instance.isRTL ? TextDirection.rtl : TextDirection.ltr,
                    children: [
                      Container(
                        margin: FlutterDictionary.instance.isRTL
                            ? const EdgeInsets.only(left: 8.0)
                            : const EdgeInsets.only(right: 8.0),
                        child: FlutterDictionary.instance.isRTL
                            ? Transform.rotate(
                                angle: math.pi,
                                child: Image.asset(
                                  ImageAssets.backArrow,
                                  color: AppColors.black,
                                  height: 18.0,
                                ),
                              )
                            : Image.asset(
                                ImageAssets.backArrow,
                                color: AppColors.white,
                                height: 18.0,
                              ),
                      ),
                      SizedBox(
                        width: 60.0,
                        child: Text(
                          _language.back,
                          style: AppFonts.normalMediumTextStyle,
                          maxLines: 1,
                        ),
                      ),
                    ],
                  ),
                  onTap: () {},
                ),
              ),
              Positioned(
                top: 301.0,
                child: Column(
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: 20.0,
                      decoration: BoxDecoration(
                        color: AppColors.white,
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                    CongratulationBlock(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
