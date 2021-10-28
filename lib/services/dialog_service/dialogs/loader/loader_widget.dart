import 'package:flutter/material.dart';
import 'package:fridge_yellow_team_bloc/dictionary/data/en.dart';
import 'package:fridge_yellow_team_bloc/dictionary/dictionary_classes/dialog_language.dart';
import 'package:fridge_yellow_team_bloc/dictionary/flutter_dictionary.dart';
import 'package:fridge_yellow_team_bloc/res/app_fonts.dart';
import 'package:fridge_yellow_team_bloc/res/app_styles/app_colors.dart';
import 'package:fridge_yellow_team_bloc/res/image_assets.dart';

class LoaderWidget extends StatelessWidget {
  final DialogLanguage language = FlutterDictionary.instance.language?.dialogLanguage ?? en.dialogLanguage;
  final bool isRtl = FlutterDictionary.instance.isRTL;

  LoaderWidget({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: Dialog(
        elevation: 0.0,
        backgroundColor: AppColors.transparent,
        child: SizedBox(
          height: 85.0,
          child: Column(
            children: [
              Image.asset(
                ImageAssets.loadingGif,
                height: 45.0,
                width: 45.0,
              ),
              Container(
                margin: const EdgeInsets.only(top: 16.0),
                child: Text(
                  language.loadingText,
                  textDirection: isRtl ? TextDirection.rtl : TextDirection.ltr,
                  style: AppFonts.medium16Height24WhiteTextStyle,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
