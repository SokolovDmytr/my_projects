import 'package:flutter/material.dart';

class OverlayContainerClipper extends CustomClipper<Path> {
  final double _borderRadius;
  final double _triangleHeight;
  final double _triangleWidth;

  const OverlayContainerClipper({
    required double borderRadius,
    required double triangleHeight,
    required double triangleWidth,
  })  : _borderRadius = borderRadius,
        _triangleHeight = triangleHeight,
        _triangleWidth = triangleWidth;

  @override
  Path getClip(Size size) {
    final Path path = Path();

    path.moveTo(
      _borderRadius,
      _triangleHeight,
    );
    path.lineTo(
      size.width / 2 - _triangleWidth / 2,
      _triangleHeight,
    );
    path.lineTo(
      size.width / 2,
      0.0,
    );
    path.lineTo(
      size.width / 2 + _triangleWidth / 2,
      _triangleHeight,
    );
    path.lineTo(
      size.width - _borderRadius,
      _triangleHeight,
    );
    path.quadraticBezierTo(
      size.width,
      _triangleHeight,
      size.width,
      _triangleHeight + _borderRadius,
    );
    path.lineTo(
      size.width,
      size.height - _borderRadius,
    );
    path.quadraticBezierTo(
      size.width,
      size.height,
      size.width - _borderRadius,
      size.height,
    );
    path.lineTo(
      _borderRadius,
      size.height,
    );
    path.quadraticBezierTo(
      0.0,
      size.height,
      0.0,
      size.height - _borderRadius,
    );
    path.lineTo(
      0.0,
      20.0 + _borderRadius,
    );
    path.quadraticBezierTo(
      0.0,
      _triangleHeight,
      _borderRadius,
      _triangleHeight,
    );
    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}