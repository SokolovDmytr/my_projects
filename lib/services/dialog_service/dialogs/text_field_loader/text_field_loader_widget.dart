import 'package:flutter/material.dart';
import 'package:yellow_team_fridge/res/image_assets.dart';

class TextFieldLoaderWidget extends StatefulWidget {
  Function(bool value) rebuild;
  bool isVisible;

  TextFieldLoaderWidget({
    this.isVisible = false,
  }) : super(
          key: Key('TextFieldLoaderWidget'),
        );

  @override
  _TextFieldLoaderWidgetState createState() => _TextFieldLoaderWidgetState();
}

class _TextFieldLoaderWidgetState extends State<TextFieldLoaderWidget> {
  @override
  void initState() {
    super.initState();

    widget.rebuild = ((bool value) {
      setState(() {
        widget.isVisible = value;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 30.0,
      height: 30.0,
      child: Visibility(
        visible: widget.isVisible,
        child: Image.asset(
          ImageAssets.loadingGif,
        ),
      ),
    );
  }
}
