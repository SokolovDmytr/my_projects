import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:memes/res/app_styles/app_colors.dart';
import 'package:memes/res/app_styles/app_shadows.dart';
import 'package:memes/ui/global_widgets/global_button/shadow_clipper.dart';
import 'package:memes/ui/global_widgets/global_button/triangle_painter.dart';

class GlobalButton extends StatefulWidget {
  final void Function() onTap;
  final Widget? icon;

  const GlobalButton({
    required this.onTap,
    this.icon,
    Key? key,
  }) : super(key: key);

  @override
  _GlobalButtonState createState() => _GlobalButtonState();
}

class _GlobalButtonState extends State<GlobalButton> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.onTap,
      borderRadius: BorderRadius.circular(100.0),
      child: widget.icon == null
          ? Stack(
              children: [
                ClipShadow(
                  clipper: TrianglePainter(),
                  boxShadow: [
                    AppShadows.neonGreenSpread1Shadow,
                  ],
                  child: Container(
                    height: 50.0,
                    width: 50.0,
                    decoration: BoxDecoration(
                      color: AppColors.neonBlue,
                    ),
                  ),
                ),
              ],
            )
          : Container(
              height: 50.0,
              width: 50.0,
              decoration: BoxDecoration(
                color: AppColors.neonBlue,
                shape: BoxShape.circle,
                boxShadow: [
                  AppShadows.neonGreenSpread1Shadow,
                ],
              ),
              child: widget.icon,
            ),
    );
  }
}
