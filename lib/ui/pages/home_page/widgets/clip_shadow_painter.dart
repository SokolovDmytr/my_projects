import 'package:flutter/material.dart';

class ClipShadowShadowPainter extends CustomPainter {
  final Shadow shadow;
  final CustomClipper<Path> clipper;

  const ClipShadowShadowPainter({
    required this.shadow,
    required this.clipper,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = shadow.toPaint();
    final Path clipPath = clipper.getClip(size).shift(shadow.offset);
    canvas.drawPath(clipPath, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}