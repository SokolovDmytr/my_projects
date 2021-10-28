import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fridge_yellow_team_bloc/dictionary/flutter_dictionary.dart';
import 'package:fridge_yellow_team_bloc/res/app_styles/app_colors.dart';

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
  final EdgeInsets innerPadding;

  const GlobalButton({
    required Key key,
    required this.text,
    required this.fontText,
    required this.onTap,
    this.width,
    this.height,
    this.icon,
    this.gradient,
    this.borderColor,
    this.borderGradient,
    this.shadows,
    this.color = AppColors.white,
    this.borderRadius = 10.0,
    this.innerPadding,
  }) : super(key: key);

  @override
  _GlobalButtonState createState() => _GlobalButtonState();
}

class _GlobalButtonState extends State<GlobalButton> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.onTap,
      borderRadius: BorderRadius.circular(widget.borderRadius),
      child: Container(
        width: widget.width,
        height: widget.height,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          gradient: widget.borderGradient,
          color: widget.borderColor,
          boxShadow: widget.shadows,
          borderRadius: BorderRadius.circular(widget.borderRadius),
        ),
        child: Container(
          width: (widget.borderGradient == null && widget.borderColor == null) ? widget.width : widget.width - 2.0,
          height: (widget.borderGradient == null && widget.borderColor == null) ? widget.height : widget.height - 2.0,
          padding: widget.innerPadding ?? EdgeInsets.zero,
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
                      margin: EdgeInsets.only(
                        right: FlutterDictionary.instance.isRTL ? 0.0 : 50.0,
                        left: FlutterDictionary.instance.isRTL ? 50.0 : 0.0,
                      ),
                      child: widget.icon,
                    ),
              Flexible(
                child: RichText(
                  overflow: TextOverflow.ellipsis,
                  softWrap: false,
                  text: TextSpan(
                    text: widget.text,
                    style: widget.fontText,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
