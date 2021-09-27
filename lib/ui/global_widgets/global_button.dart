import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:yellow_team_fridge/res/app_styles/app_colors.dart';

class GlobalButton extends StatefulWidget {
  final double _width;
  final double _height;
  final String _text;
  final TextStyle _fontText;
  final Function _onTap;
  final LinearGradient _gradient;
  final Color _color;
  final Image _icon;
  final List<BoxShadow> _shadows;
  final Color _borderColor;
  final double _borderRadius;

  const GlobalButton({
    @required Key key,
    @required double width,
    @required double height,
    @required String text,
    @required TextStyle fontText,
    @required Function onTap,
    Image icon,
    LinearGradient gradient,
    Color borderColor,
    List<BoxShadow> shadows,
    Color color = AppColors.white,
    double borderRadius = 10.0,
  })  : _width = width,
        _height = height,
        _text = text,
        _fontText = fontText,
        _onTap = onTap,
        _gradient = gradient,
        _color = color,
        _icon = icon,
        _shadows = shadows,
        _borderColor = borderColor,
        _borderRadius = borderRadius,
        super(key: key);

  @override
  _GlobalButtonState createState() => _GlobalButtonState();
}

class _GlobalButtonState extends State<GlobalButton> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Container(
        width: widget._width,
        height: widget._height,
        decoration: BoxDecoration(
          color: widget._color,
          gradient: widget._gradient,
          boxShadow: widget._shadows,
          borderRadius: BorderRadius.circular(widget._borderRadius),
          border: Border.all(
            color: widget._borderColor ?? widget._color,
          ),
        ),
        alignment: Alignment.center,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            widget._icon == null
                ? const SizedBox()
                : Container(
                    width: 20.0,
                    height: 20.0,
                    margin: const EdgeInsets.only(right: 55.0),
                    child: widget._icon,
                  ),
            RichText(
              overflow: TextOverflow.ellipsis,
              softWrap: false,
              text: TextSpan(
                text: widget._text,
                style: widget._fontText,
              ),
            ),
          ],
        ),
      ),
      onTap: widget._onTap,
    );
  }
}
