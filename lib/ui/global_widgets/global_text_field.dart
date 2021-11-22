import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:memes/res/app_fonts.dart';
import 'package:memes/res/app_gradients.dart';
import 'package:memes/res/app_styles/app_colors.dart';
import 'package:memes/res/app_styles/app_shadows.dart';

class GlobalTextField extends StatefulWidget {
  final TextEditingController controller;
  final void Function(String)? onChanged;
  final bool? numberInput;
  final String? hintText;

  const GlobalTextField({
    required this.controller,
    this.onChanged,
    this.hintText,
    this.numberInput = false,
    Key? key,
  }) : super(key: key);

  @override
  _GlobalTextFieldState createState() => _GlobalTextFieldState();
}

class _GlobalTextFieldState extends State<GlobalTextField> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50.0,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5.0),
        color: AppColors.grey,
        boxShadow: [
          AppShadows.greyShadowTopLeft,
          AppShadows.blackShadowBottomRight,
        ],
        gradient: AppGradients.greyTopLeftToBottomRight,
      ),
      child: TextFormField(
        keyboardType: widget.numberInput! ? TextInputType.number : TextInputType.text,
        inputFormatters: [
          if (widget.numberInput!) LengthLimitingTextInputFormatter(2),
        ],
        onChanged: widget.onChanged,
        controller: widget.controller,
        style: AppFonts.robotoWhite18BoldOpacity065,
        decoration: InputDecoration(
          isDense: true,
          hintText: widget.hintText,
          hintStyle: AppFonts.robotoWhite18BoldOpacity03,
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: AppColors.transparent),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: AppColors.transparent),
          ),
        ),
      ),
    );
  }
}
