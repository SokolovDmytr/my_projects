import 'package:flutter/material.dart';
import 'package:fridge_yellow_team_bloc/res/image_assets.dart';

class TextFieldLoaderWidget extends StatefulWidget {
  late Function(bool value)? rebuild;

  TextFieldLoaderWidget() : super(key: UniqueKey());

  @override
  _TextFieldLoaderWidgetState createState() => _TextFieldLoaderWidgetState();
}

class _TextFieldLoaderWidgetState extends State<TextFieldLoaderWidget> {
  bool isVisible = false;

  @override
  void initState() {
    super.initState();

    widget.rebuild = ((bool value) {
      setState(() {
        isVisible = value;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(5.0),
      width: 25.0,
      height: 25.0,
      child: Visibility(
        visible: isVisible,
        child: Image.asset(
          ImageAssets.loadingGif,
        ),
      ),
    );
  }
}
