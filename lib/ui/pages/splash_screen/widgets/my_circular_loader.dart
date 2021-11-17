import 'package:flutter/material.dart';
import 'package:memes/res/app_duration.dart';
import 'package:memes/res/app_styles/app_colors.dart';
import 'package:memes/res/app_styles/app_shadows.dart';

class MyCircularLoader extends StatefulWidget {
  @override
  _MyCircularLoaderState createState() => new _MyCircularLoaderState();
}

class _MyCircularLoaderState extends State<MyCircularLoader> with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> animation;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      duration: AppDuration.threeSeconds,
      vsync: this,
    );
    animation = Tween(begin: 0.0, end: 1.4).animate(controller)
      ..addListener(() {
        setState(() {});
      });
    controller.repeat(reverse: true);
  }

  @override
  void dispose() {
    controller.stop();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Center(
          child: Container(
            width: 100.0,
            height: 100.0,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              boxShadow: [
                AppShadows.neonGreenSpread1Shadow,
              ],
            ),
            child: CircularProgressIndicator(
              value: animation.value,
              backgroundColor: AppColors.transparent,
              color: AppColors.neonGreen,
              strokeWidth: 15.0,
            ),
          ),
        ),
        Positioned(
          top: 8.0,
          right: MediaQuery.of(context).size.width / 2 - 42.5,
          child: Container(
            height: 85,
            width: 85,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: AppColors.black,
            ),
          ),
        ),
      ],
    );
  }
}
