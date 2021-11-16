import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RotatingLoadingCircle extends StatefulWidget {
  @override
  _RotatingLoadingCircleState createState() => _RotatingLoadingCircleState();
}

class _RotatingLoadingCircleState extends State<RotatingLoadingCircle> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Theme(
        data: ThemeData(
          cupertinoOverrideTheme: CupertinoThemeData(
            brightness: Brightness.dark,
          ),
        ),
        child: CupertinoActivityIndicator(
          animating: true,
          radius: 18.0,
        ),
      ),
    );
  }
}
