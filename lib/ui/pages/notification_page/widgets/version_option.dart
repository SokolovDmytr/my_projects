import 'package:flutter/material.dart';
import 'package:fridge_yellow_team_bloc/dictionary/flutter_dictionary.dart';
import 'package:fridge_yellow_team_bloc/res/app_duration.dart';
import 'package:fridge_yellow_team_bloc/res/app_fonts.dart';
import 'package:fridge_yellow_team_bloc/res/app_styles/app_colors.dart';

class VersionOption extends StatefulWidget {
  final String title;
  final Key newKey;
  final String openedText;

  VersionOption({
    required this.newKey,
    required this.title,
    required this.openedText,
  }) : super(key: UniqueKey());

  @override
  _VersionOptionState createState() => _VersionOptionState();
}

class _VersionOptionState extends State<VersionOption> with SingleTickerProviderStateMixin {
  final FocusNode _focusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _focusNode.addListener(() {
      if (!_focusNode.hasFocus) {
        setState(() {});
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final TextPainter textPainterMainTitle = TextPainter(
      text: TextSpan(
        text: widget.openedText,
        style: AppFonts.mediumTextStyleBlackTwo,
      ),
      textDirection: TextDirection.ltr,
    )..layout();

    return Padding(
      padding: const EdgeInsets.only(top: 29.0),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  widget.title,
                  style: AppFonts.mediumTextStyleBlackTwo,
                ),
                InkWell(
                  borderRadius: BorderRadius.circular(10.0),
                  onTap: () {
                    setState(() {
                      _focusNode.hasFocus
                          ? FocusManager.instance.primaryFocus!.unfocus()
                          : FocusScope.of(context).requestFocus(_focusNode);
                    });
                  },
                  child: RotatedBox(
                    quarterTurns: _focusNode.hasFocus ? 3 : 1,
                    child: Icon(
                      Icons.arrow_forward_ios_sharp,
                      color: AppColors.marigold,
                    ),
                  ),
                ),
              ],
            ),
          ),
          AnimatedSize(
            duration: AppDuration.notificationPageOpenBlockDuration,
            child: Container(
              alignment: FlutterDictionary.instance.isRTL ? Alignment.topRight : Alignment.topLeft,
              padding: const EdgeInsets.only(bottom: 24.0),
              height: !_focusNode.hasFocus ? 0.0 : textPainterMainTitle.height + 20.0,
              child: Text(
                widget.openedText,
                style: AppFonts.medium16blackTwoTextStyle,
              ),
            ),
          ),
          Divider(
            height: 0.5,
            color: AppColors.black.withOpacity(0.5),
          ),
        ],
      ),
    );
  }
}
