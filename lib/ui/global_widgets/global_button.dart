import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:yellow_team_fridge/res/app_styles/app_colors.dart';

class GlobalButton extends StatefulWidget {
  final double width;
  final double height;
  final String text;
  final TextStyle fontText;
  final Function onTap;
  final LinearGradient gradient;
  final Color color;
  final Image icon;
  final List<BoxShadow> shadows;
  final Color borderColor;
  final LinearGradient borderGradient;
  final double borderRadius;
  final EdgeInsets padding;

  const GlobalButton({
    @required Key key,
    @required this.text,
    @required this.fontText,
    @required this.onTap,
    this.width,
    this.height,
    this.icon,
    this.gradient,
    this.borderColor,
    this.padding,
    this.borderGradient,
    this.shadows,
    this.color = AppColors.white,
    this.borderRadius = 10.0,
  }) : super(key: key);

  @override
  _GlobalButtonState createState() => _GlobalButtonState();
}

class _GlobalButtonState extends State<GlobalButton> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: widget.padding ?? const EdgeInsets.all(0.0),
      child: InkWell(
        child: Stack(
          alignment: Alignment.center,
          children: [
            Container(
              width: widget.width,
              height: widget.height,
              decoration: BoxDecoration(
                color: widget.borderColor ?? widget.color,
                gradient: widget.borderGradient,
                boxShadow: widget.shadows,
                borderRadius: BorderRadius.circular(widget.borderRadius),
              ),
            ),
            Container(
              width: widget.padding == null
                  ? 0.0
                  : widget.borderColor == null
                      ? widget.width
                      : widget.width - 2.0,
              height: widget.borderColor == null ? widget.height : widget.height - 2.0,
              decoration: BoxDecoration(
                color: widget.color,
                gradient: widget.gradient,
                borderRadius: BorderRadius.circular(widget.borderRadius),
              ),
              alignment: Alignment.center,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  widget.icon == null
                      ? const SizedBox()
                      : Container(
                          width: 20.0,
                          height: 20.0,
                          margin: const EdgeInsets.only(right: 55.0),
                          child: widget.icon,
                        ),
                  RichText(
                    overflow: TextOverflow.ellipsis,
                    softWrap: false,
                    text: TextSpan(
                      text: widget.text,
                      style: widget.fontText,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        onTap: widget.onTap,
      ),
    );
  }
}
