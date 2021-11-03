import 'package:flutter/material.dart';
import 'package:fridge_yellow_team_bloc/dictionary/data/en.dart';
import 'package:fridge_yellow_team_bloc/dictionary/dictionary_classes/authentication_page_language.dart';
import 'package:fridge_yellow_team_bloc/dictionary/flutter_dictionary.dart';
import 'package:fridge_yellow_team_bloc/res/app_fonts.dart';
import 'package:fridge_yellow_team_bloc/res/app_styles/app_colors.dart';
import 'package:fridge_yellow_team_bloc/res/app_styles/app_shadows.dart';

class GlobalTextField extends StatefulWidget {
  final TextStyle? hintStyle;
  final String? hintText;
  final bool needShowButton;
  final Widget? loader;
  final bool needPrefix;
  final bool needSuffix;
  final bool showInPut;
  final EdgeInsets? padding;
  final TextEditingController? controller;
  final FocusNode? focusNode;
  final void Function(String)? onSubmitted;
  final Function(String text)? onChanged;
  final Color? errorColor;

  const GlobalTextField({
    required this.needSuffix,
    required this.needPrefix,
    required this.needShowButton,
    required this.showInPut,
    this.onSubmitted,
    this.loader,
    this.padding,
    this.hintText,
    this.hintStyle,
    this.controller,
    this.focusNode,
    this.onChanged,
    this.errorColor,
    Key? key,
  }) : super(key: key);

  @override
  _GlobalTextFieldState createState() => _GlobalTextFieldState();
}

class _GlobalTextFieldState extends State<GlobalTextField> {
  late bool passwordVisible;

  @override
  void initState() {
    if (widget.needShowButton) {
      passwordVisible = true;
    } else {
      passwordVisible = false;
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final AuthenticationPageLanguage _language = FlutterDictionary.instance.language?.authenticationPageLanguage ?? en.authenticationPageLanguage;
    return Container(
      height: 44.0,
      margin: widget.padding ?? const EdgeInsets.all(0.0),
      decoration: BoxDecoration(
        color: AppColors.white,
        boxShadow: AppShadows.textFieldShadow,
        borderRadius: BorderRadius.circular(10.0),
        border: Border.all(color: widget.errorColor ?? AppColors.transparent),
      ),
      child: Directionality(
        textDirection: FlutterDictionary.instance.isRTL ? TextDirection.rtl : TextDirection.ltr,
        child: TextFormField(
          key: widget.key,
          obscureText: passwordVisible,
          onFieldSubmitted: widget.onSubmitted,
          controller: widget.controller,
          focusNode: widget.focusNode ?? FocusNode(),
          onChanged: widget.onChanged,
          textAlignVertical: TextAlignVertical.center,
          style: AppFonts.medium16Height24TextStyle,
          decoration: InputDecoration(
            isDense: true,
            prefixIconConstraints: BoxConstraints(
              maxHeight: widget.needPrefix ? 18.0 : 0.0,
              minWidth: 16.0,
            ),
            contentPadding: const EdgeInsets.only(
              top: 15.0,
              bottom: 8.0,
            ),
            prefixIcon: widget.needPrefix
                ? Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 9.0,
                    ),
                    child: Icon(
                      Icons.search_sharp,
                      color: AppColors.black36,
                    ),
                  )
                : const SizedBox(),
            suffixIcon: widget.needSuffix
                ? widget.loader != null
                    ? widget.loader
                    : widget.needShowButton
                        ? Padding(
                            padding: const EdgeInsets.only(right: 16.0, top: 10.0, left: 16.0),
                            child: InkWell(
                              onTap: () {
                                setState(() {
                                  passwordVisible = !passwordVisible;
                                });
                              },
                              child: Text(
                                _language.buttonShow,
                                style: AppFonts.size16RegMarigold,
                              ),
                            ),
                          )
                        : const SizedBox()
                : const SizedBox(),
            hintText: widget.hintText,
            hintStyle: widget.hintStyle,
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: AppColors.transparent),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: AppColors.transparent),
            ),
          ),
        ),
      ),
    );
  }
}
