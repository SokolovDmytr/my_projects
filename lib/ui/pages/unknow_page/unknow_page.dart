import 'package:flutter/material.dart';
import 'package:yellow_team_fridge/res/app_fonts.dart';

class UnknownPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        alignment: Alignment.center,
        child: Center(
          child: Text(
            'Unknown Page',
            style: AppFonts.mediumTextStyle,
          ),
        ),
      ),
    );
  }
}
