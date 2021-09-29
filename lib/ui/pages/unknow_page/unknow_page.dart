import 'package:flutter/material.dart';
import 'package:yellow_team_fridge/res/app_fonts.dart';
import 'package:yellow_team_fridge/ui/global_widgets/bottom_navigation_bar/navigation_bottom_bar.dart';

class UnknownPage extends StatelessWidget {
  UnknownPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CustomNavigationBottomBar(),
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
