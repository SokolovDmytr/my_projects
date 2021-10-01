import 'package:flutter/material.dart';
import 'package:yellow_team_fridge/res/image_assets.dart';

class CongratulationBlock extends StatelessWidget {
  const CongratulationBlock({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 40.0),
      child: Image.asset(ImageAssets.bonAppetitLogo),
    );
  }
}
