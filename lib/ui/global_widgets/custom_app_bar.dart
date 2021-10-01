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
    @required this.isMainStyleAppBar,
    this.title,
    this.color,
    this.gradient,
    this.textButton,
    this.onTapBack,
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
                        textDirection: FlutterDictionary.instance.isRTL ? TextDirection.rtl : TextDirection.ltr,
                        children: [
                          Container(
                            margin: FlutterDictionary.instance.isRTL ? const EdgeInsets.only(left: 8.0) : const EdgeInsets.only(right: 8.0),
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
                          SizedBox(
                            width: 60.0,
                            child: Text(
                              textButton,
                              style: AppFonts.medium16Height24TextStyle,
                              maxLines: 1,
                            ),
                          ),
                        ],
                      ),
                      onTap: onTapBack,
                    ),
                  ),
                  title == null
                      ? const SizedBox()
                      : Container(
                          width: 140.0,
                          margin: const EdgeInsets.only(bottom: 10.0),
                          child: RichText(
                            textAlign: TextAlign.center,
                            overflow: TextOverflow.ellipsis,
                            text: TextSpan(
                              text: title,
                              style: AppFonts.normalBlackHeight30TextStyle,
                            ),
                          ),
                        )
                ],
              ),
            ),
          )
        : SizedBox(
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
                    painter: AppBarCurvePainter(),
                  ),
                ),
              ],
            ),
          );
  }
}
