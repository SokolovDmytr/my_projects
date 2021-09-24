import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:yellow_team_fridge/dictionary/flutter_dictionary.dart';
import 'package:yellow_team_fridge/res/app_fonts.dart';
import 'package:yellow_team_fridge/res/app_styles/app_colors.dart';
import 'package:yellow_team_fridge/res/image_assets.dart';
import 'package:yellow_team_fridge/ui/global_widgets/app_bar_curve_painter.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final Size _preferredSize;
  final String title;
  final Color color;
  final LinearGradient gradient;
  final String textButton;
  final Function onTapBack;
  final bool isMainStyleAppBar;

  const CustomAppBar({
    @required Size preferredSize,
    this.title,
    this.color,
    this.gradient,
    this.textButton,
    this.onTapBack,
    @required this.isMainStyleAppBar,
    Key key,
  })  : _preferredSize = preferredSize,
        super(key: key);

  @override
  Size get preferredSize {
    return _preferredSize;
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarIconBrightness: Brightness.dark,
        statusBarColor: AppColors.transparent,
      ),
    );

    return isMainStyleAppBar
        ? Container(
            height: _preferredSize.height,
            decoration: BoxDecoration(
              color: color,
              gradient: gradient,
            ),
            child: Container(
              margin: const EdgeInsets.symmetric(
                horizontal: 16.0,
              ),
              child: Stack(
                alignment: Alignment.bottomCenter,
                children: [
                  Container(
                    margin: const EdgeInsets.only(bottom: 13.0),
                    child: InkWell(
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            margin: const EdgeInsets.only(right: 8.0),
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
                                    color: AppColors.black,
                                    height: 18.0,
                                  ),
                          ),
                          Container(
                            width: 60.0,
                            child: Text(
                              textButton,
                              style: AppFonts.medium16TextStyle,
                              maxLines: 1,
                            ),
                          ),
                        ],
                      ),
                      onTap: onTapBack,
                    ),
                  ),
                  Container(
                    width: 140.0,
                    margin: const EdgeInsets.only(bottom: 7.0),
                    child: RichText(
                      overflow: TextOverflow.ellipsis,
                      text: TextSpan(
                        text: title,
                        style: AppFonts.normalBlackTextStyle,
                      ),
                    ),
                  )
                ],
              ),
            ),
          )
        : Container(
            height: _preferredSize.height,
            child: Stack(
              children: [
                Container(
                  decoration: BoxDecoration(
                    gradient: gradient,
                  ),
                ),
                Transform.rotate(
                  angle: math.pi,
                  child: CustomPaint(
                    child: Container(),
                    painter: AppBarCurveCurvepainter(),
                  ),
                ),
              ],
            ),
          );
  }
}
