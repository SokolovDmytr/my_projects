import 'package:flutter/material.dart';
import 'package:memes/res/app_fonts.dart';
import 'package:memes/res/app_styles/app_colors.dart';

class GlobalTextField extends StatefulWidget {
  final TextEditingController controller;
  final void Function(String)? onChanged;

  const GlobalTextField({
    required this.controller,
    this.onChanged,
    Key? key,
  }) : super(key: key);

  @override
  _GlobalTextFieldState createState() => _GlobalTextFieldState();
}

class _GlobalTextFieldState extends State<GlobalTextField> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
      height: 60.0,
      child: TextFormField(
        onChanged: widget.onChanged,
        controller: widget.controller,
        style: AppFonts.inputText,
        decoration: InputDecoration(
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: AppColors.purpleBlue),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: AppColors.purpleBlue),
          ),
        ),
      ),
    );
  }
}
