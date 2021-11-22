import 'package:flutter/widgets.dart';

class _ClipShadowPainter extends CustomPainter {
  final CustomClipper<Path> clipper;
  final List<BoxShadow> clipShadow;

  _ClipShadowPainter({
    required this.clipper,
    required this.clipShadow
  });

  @override
  void paint(Canvas canvas, Size size) {
    clipShadow.forEach((BoxShadow shadow) {
      var paint = shadow.toPaint();
      var spreadSize = Size(size.width + shadow.spreadRadius * 2, size.height + shadow.spreadRadius * 2);
      var clipPath = clipper.getClip(spreadSize).shift(Offset(
          shadow.offset.dx - shadow.spreadRadius,
          shadow.offset.dy - shadow.spreadRadius
      ));
      canvas.drawPath(clipPath, paint);
    });
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}

class ClipShadow extends StatelessWidget {
  final List<BoxShadow> boxShadow;
  final CustomClipper<Path> clipper;
  final Widget child;

  ClipShadow({
    required this.boxShadow,
    required this.clipper,
    required this.child
  });

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: _ClipShadowPainter(
          clipShadow: boxShadow,
          clipper: clipper
      ),
      child: ClipPath(
        clipper: clipper,
        child: child,
      ),
    );
  }
}
