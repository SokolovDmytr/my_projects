import 'package:flutter/material.dart';

class OverlayContainerClipper extends CustomClipper<Path> {
  final double _borderRadius;

  const OverlayContainerClipper({
    @required double borderRadius,
  }) : _borderRadius = borderRadius;

  @override
  Path getClip(Size size) {
    final Path path = Path();

    path.moveTo(_borderRadius, 20.0);
    path.lineTo(size.width / 2 - 8, 20.0);
    path.lineTo(size.width / 2, 0.0);
    path.lineTo(size.width / 2 + 8, 20.0);
    path.lineTo(size.width - _borderRadius, 20.0);
    path.quadraticBezierTo(size.width, 20.0, size.width, 20.0 + _borderRadius);
    path.lineTo(size.width, size.height - _borderRadius);
    path.quadraticBezierTo(
        size.width, size.height, size.width - _borderRadius, size.height);
    path.lineTo(_borderRadius, size.height);
    path.quadraticBezierTo(0.0, size.height, 0.0, size.height - _borderRadius);
    path.lineTo(0.0, 20.0 + _borderRadius);
    path.quadraticBezierTo(0.0, 20.0, _borderRadius, 20.0);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}
