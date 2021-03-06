import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fridge_yellow_team_bloc/dictionary/dictionary_classes/dialog_language.dart';
import 'package:fridge_yellow_team_bloc/dictionary/flutter_dictionary.dart';
import 'package:fridge_yellow_team_bloc/res/app_fonts.dart';
import 'package:fridge_yellow_team_bloc/res/app_styles/app_colors.dart';
import 'package:fridge_yellow_team_bloc/res/app_styles/app_gradient.dart';
import 'package:fridge_yellow_team_bloc/services/dialog_service/dialog_service.dart';
import 'package:fridge_yellow_team_bloc/ui/global_widgets/global_button.dart';

class RemoveFavouriteDialogWidget extends StatelessWidget {
  final void Function() onTapYes;
  final DialogLanguage language = FlutterDictionary.instance.language.dialogLanguage;

  RemoveFavouriteDialogWidget({
    required this.onTapYes,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      insetPadding: const EdgeInsets.symmetric(horizontal: 15.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            alignment: FlutterDictionary.instance.isRTL ? Alignment.topLeft : Alignment.topRight,
            margin: const EdgeInsets.only(
              top: 18.0,
              right: 18.0,
              left: 18.0,
            ),
            child: InkWell(
              borderRadius: BorderRadius.circular(10.0),
              onTap: () => DialogService.instance.close(),
              child: Icon(
                Icons.clear,
                color: AppColors.pastelRed,
                size: 24.0,
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(
              left: 42.0,
              right: 42.0,
              bottom: 30.0,
            ),
            alignment: Alignment.center,
            child: Text(
              language.removeRecipeFromFavouritesText,
              textAlign: TextAlign.center,
              style: AppFonts.normalBlackTwoTextStyle,
            ),
          ),
          Container(
            margin: const EdgeInsets.only(bottom: 50.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GlobalButton(
                  key: UniqueKey(),
                  width: 127.0,
                  height: 56.0,
                  text: language.logOutPopUpButtonNoText,
                  fontText: AppFonts.normalMediumTextStyle,
                  onTap: () => DialogService.instance.close(),
                  gradient: AppGradient.wheatMarigoldGradient,
                ),
                const SizedBox(width: 16.0),
                GlobalButton(
                  key: UniqueKey(),
                  width: 127.0,
                  height: 56.0,
                  text: language.logOutPopUpButtonYesText,
                  fontText: AppFonts.normalMediumMariGoldTextStyle,
                  onTap: () {
                    DialogService.instance.close();
                    onTapYes();
                  },
                  borderGradient: AppGradient.wheatMarigoldGradient,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
