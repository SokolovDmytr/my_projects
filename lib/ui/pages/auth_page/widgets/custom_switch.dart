import 'package:flutter/material.dart';
import 'package:yellow_team_fridge/dictionary/data/en.dart';
import 'package:yellow_team_fridge/dictionary/dictionary_classes/authentication_page_language.dart';
import 'package:yellow_team_fridge/dictionary/flutter_dictionary.dart';
import 'package:yellow_team_fridge/res/app_fonts.dart';
import 'package:yellow_team_fridge/res/app_styles/app_colors.dart';
import 'package:yellow_team_fridge/res/const.dart';

class CustomSwitch extends StatefulWidget {
  final bool value;
  final ValueChanged<bool> onChanged;

  CustomSwitch({
    Key key,
    this.value,
    this.onChanged,
  }) : super(key: key);

  @override
  _CustomSwitchState createState() => _CustomSwitchState();
}

class _CustomSwitchState extends State<CustomSwitch> with SingleTickerProviderStateMixin {
  AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: MILLISECONDS_300,
    );
  }

  @override
  Widget build(BuildContext context) {
    final AuthenticationPageLanguage _language =
        FlutterDictionary.instance.language?.authenticationPageLanguage ?? en.authenticationPageLanguage;
    return AnimatedBuilder(
      animation: _animationController,
      builder: (context, child) {
        return GestureDetector(
          onTap: () {
            if (_animationController.isCompleted) {
              _animationController.reverse();
            } else {
              _animationController.forward();
            }
            widget.value == false ? widget.onChanged(true) : widget.onChanged(false);
          },
          child: Stack(
            children: [
              Container(
                height: 50.0,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100.0),
                  border: Border.all(
                    color: AppColors.whiteTwo,
                  ),
                  color: AppColors.whiteThree,
                ),
                child: Container(
                  alignment: widget.value ? Alignment.centerRight : Alignment.centerLeft,
                  padding: const EdgeInsets.only(right: 1.0, left: 1.0),
                  child: Container(
                    width: (MediaQuery.of(context).size.width - 32) / 2,
                    height: 46.0,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100.0),
                      color: AppColors.white,
                    ),
                  ),
                ),
              ),
              Positioned(
                top: 15.0,
                bottom: 15.0,
                left: 62.0,
                child: Text(
                  _language.signIn,
                  style: widget.value ? AppFonts.size16MediumPinkishGrey : AppFonts.size16SemiBoldMarigold,
                ),
              ),
              Positioned(
                top: 15.0,
                bottom: 15.0,
                right: 62.0,
                child: Text(
                  _language.signUp,
                  style: widget.value ? AppFonts.size16SemiBoldMarigold : AppFonts.size16MediumPinkishGrey,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
