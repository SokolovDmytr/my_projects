import 'package:flutter/material.dart';
import 'package:yellow_team_fridge/dictionary/data/en.dart';
import 'package:yellow_team_fridge/dictionary/dictionary_classes/authentication_page_language.dart';
import 'package:yellow_team_fridge/dictionary/flutter_dictionary.dart';
import 'package:yellow_team_fridge/res/app_fonts.dart';
import 'package:yellow_team_fridge/res/app_styles/app_colors.dart';
import 'package:yellow_team_fridge/res/app_styles/app_shadows.dart';

class GlobalTextField extends StatefulWidget {
  final TextStyle hintStyle;
  final String hintText;
  final bool needShowButton;
  final bool needLoader;
  final bool needPrefix;
  final bool needSuffix;
  final EdgeInsets padding;
  final TextEditingController controller;

  const GlobalTextField({
    @required this.needSuffix,
    @required this.needLoader,
    @required this.needPrefix,
    @required this.needShowButton,
    this.padding,
    this.hintText,
    this.hintStyle,
    this.controller,
    Key key,
  }) : super(key: key);

  @override
  _GlobalTextFieldState createState() => _GlobalTextFieldState();
}

class _GlobalTextFieldState extends State<GlobalTextField> {
  @override
  Widget build(BuildContext context) {
    final AuthenticationPageLanguage _language =
        FlutterDictionary.instance.language?.authenticationPageLanguage ?? en.authenticationPageLanguage;
    return Container(
      height: 42.0,
      margin: widget.padding ?? const EdgeInsets.all(0.0),
      decoration: BoxDecoration(
        color: AppColors.white,
        boxShadow: AppShadows.textFieldShadow,
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: TextFormField(
        controller: widget.controller,
        decoration: InputDecoration(
          // isCollapsed: true,
          isDense: true,
          prefixIconConstraints: BoxConstraints(
            maxHeight: widget.needPrefix ? 18.0 : 0.0,
            minWidth: 16.0,
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
              : SizedBox(),
          contentPadding: const EdgeInsets.only(
            top: 15.0,
            bottom: 8.0,
          ),
          suffix: widget.needSuffix
              ? widget.needLoader
                  ? Text('loader')
                  : widget.needShowButton
                      ? Padding(
                          padding: const EdgeInsets.only(right: 16.0),
                          child: InkWell(
                            onTap: () {},
                            child: Text(
                              _language.buttonShow,
                              style: AppFonts.size16RegMarigold,
                            ),
                          ),
                        )
                      : SizedBox()
              : SizedBox(),
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
    );
  }
}
