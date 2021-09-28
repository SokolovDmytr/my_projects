import 'package:flutter/material.dart';
import 'package:yellow_team_fridge/res/app_fonts.dart';
import 'package:yellow_team_fridge/res/app_styles/app_colors.dart';

class VersionOption extends StatefulWidget {
  final String title;
  final String newKey;
  final String openedText;

  VersionOption({
    @required this.newKey,
    @required this.title,
    this.openedText,
  }) : super(key: Key('$newKey'));

  @override
  _VersionOptionState createState() => _VersionOptionState();
}

class _VersionOptionState extends State<VersionOption> with SingleTickerProviderStateMixin {
  double _currentHeight = 0.0;
  bool isOpened = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 29.0),
      child: AnimatedSize(
        vsync: this,
        duration: Duration(milliseconds: 400),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    widget.title,
                    style: AppFonts.mediumTextStyle,
                  ),
                  InkWell(
                    onTap: () {
                      setState(() {
                        _currentHeight = isOpened ? 0.0 : 200.0;
                        isOpened = !isOpened;
                      });
                    },
                    child: RotatedBox(
                      quarterTurns: isOpened ? 3 : 1,
                      child: Icon(
                        Icons.arrow_forward_ios_sharp,
                        color: AppColors.marigold,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.only(bottom: 24.0),
              height: _currentHeight,
              child: Text(
                widget.openedText,
                style: AppFonts.medium16blackTwoTextStyle,
              ),
            ),
            Divider(
              height: 0.5,
              color: AppColors.black.withOpacity(0.5),
            ),
          ],
        ),
      ),
    );
  }
}
