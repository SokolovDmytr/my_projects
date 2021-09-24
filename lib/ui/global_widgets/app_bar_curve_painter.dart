import 'package:flutter/material.dart';
import 'package:yellow_team_fridge/res/app_styles/app_colors.dart';

class AppBarCurveCurvepainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Path path = Path();
    Paint paint = Paint();

    path = Path();
    path.lineTo(0, size.height * 0.35);

    path.quadraticBezierTo(
      size.width * 0.10,
      size.height * 0.15,
      size.width * 0.15,
      size.height * 0.2,
    );
    path.quadraticBezierTo(
      size.width * 0.2,
      size.height * 0.2,
      size.width * 0.32,
      size.height * 0.4,
    );
    path.quadraticBezierTo(
      size.width * 0.45,
      size.height * 0.6,
      size.width * 0.68,
      size.height * 0.25,
    );
    path.quadraticBezierTo(
      size.width * 0.75,
      size.height * 0.15,
      size.width * 0.85,
      size.height * 0.05,

    );
    path.quadraticBezierTo(
      size.width * 0.95,
      size.height * 0.0,
      size.width,
      size.height * 0.2,
    );

    path.lineTo(size.width, 0.0);
    path.close();

    paint.color = AppColors.white;
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return oldDelegate != this;
  }
}
