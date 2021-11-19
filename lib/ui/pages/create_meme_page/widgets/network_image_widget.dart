import 'package:flutter/material.dart';
import 'package:memes/res/app_styles/app_colors.dart';
import 'package:memes/res/app_styles/app_shadows.dart';

class NetworkImageWidget extends StatelessWidget {
  final DecorationImage decorationImage;

  const NetworkImageWidget({
    required this.decorationImage,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 350.0,
      margin: const EdgeInsets.symmetric(horizontal: 40.0, vertical: 20.0),
      decoration: BoxDecoration(
        color: AppColors.metallicBlue,
        border: Border.all(color: AppColors.black),
        borderRadius: BorderRadius.circular(20.0),
        boxShadow: [
          AppShadows.greyShadowTopLeft,
          AppShadows.blackShadowBottomRight,
        ],
        image: decorationImage,
      ),
    );
  }
}
