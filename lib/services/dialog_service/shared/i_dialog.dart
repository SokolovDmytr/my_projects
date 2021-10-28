import 'package:flutter/material.dart';

typedef DisplayFunction = void Function(BuilderFunction);

typedef BuilderFunction = Future<void> Function(BuildContext context);

abstract class IDialog {
  final Widget child;

  const IDialog({required this.child});

  void show();
}
