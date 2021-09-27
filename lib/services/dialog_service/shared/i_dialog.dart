import 'package:flutter/material.dart';

typedef DisplayFunction = void Function(BuilderFunction);

typedef BuilderFunction = Future<void> Function(BuildContext context);

abstract class IDialog {
  Widget child;

  void show();
}
