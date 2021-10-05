import 'dart:math';

import 'package:confetti/confetti.dart';
import 'package:flutter/material.dart';
import 'package:visibility_detector/visibility_detector.dart';
import 'package:yellow_team_fridge/res/app_fonts.dart';
import 'package:yellow_team_fridge/res/app_styles/app_colors.dart';
import 'package:yellow_team_fridge/res/image_assets.dart';

class CongratulationBlock extends StatefulWidget {
  const CongratulationBlock({Key key}) : super(key: key);

  @override
  _CongratulationBlockState createState() => _CongratulationBlockState();
}

class _CongratulationBlockState extends State<CongratulationBlock> {
  ConfettiController confettiControllerTopRight =
      ConfettiController(duration: Duration(seconds: 1));
  ConfettiController confettiControllerTopLeft =
      ConfettiController(duration: Duration(seconds: 1));

  @override
  void setState(fn) {
    super.setState(fn);
    setState(() {
      confettiControllerTopLeft = ConfettiController();
      confettiControllerTopRight = ConfettiController();
    });
  }

  @override
  void dispose() {
    confettiControllerTopLeft.dispose();
    confettiControllerTopRight.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return VisibilityDetector(
      key: Key('VisibilityDetector'),
      onVisibilityChanged: (VisibilityInfo info) {
        if (info.visibleFraction > 0.5) {
          confettiControllerTopLeft.play();
          confettiControllerTopRight.play();
        }
      },
      child: Stack(
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: ConfettiWidget(
              confettiController: confettiControllerTopLeft,
              maxBlastForce: 5.0,
              minBlastForce: 2.0,
              blastDirectionality: BlastDirectionality.explosive,
              blastDirection: 7 * pi / 4,
              emissionFrequency: 0.15,
              colors: [
                AppColors.confettiRed,
                AppColors.seaBlue,
                AppColors.marigold,
              ],
            ),
          ),
          Align(
            alignment: Alignment.centerRight,
            child: ConfettiWidget(
              confettiController: confettiControllerTopRight,
              maxBlastForce: 5.0,
              minBlastForce: 2.0,
              blastDirectionality: BlastDirectionality.explosive,
              blastDirection: 5 * pi / 4,
              emissionFrequency: 0.15,
              colors: [
                AppColors.confettiRed,
                AppColors.seaBlue,
                AppColors.marigold,
              ],
            ),
          ),
          Column(
            children: [
              Container(
                height: 300.0,
                width: MediaQuery.of(context).size.width,
                margin: const EdgeInsets.symmetric(vertical: 40.0),
                child: Image.asset(ImageAssets.recipeMan3),
              ),
              Text(
                'Bon appetit',
                style: AppFonts.normalBlackTextStyle,
              )
            ],
          ),
        ],
      ),
    );
  }
}
