import 'package:flutter/material.dart';

class TrianglePainter extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    return Path()
      ..moveTo(0.0, 0.0)
      ..lineTo(size.width, 0.0)
      ..lineTo(size.width / 2, size.height)
      ..lineTo(0.0, 0.0);
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
  }
}
