import 'package:flutter/material.dart';

class DialogBuilders {
  static Future<void> defaultDialogBuilder({BuildContext context, Widget widget}) {
    return showDialog(
      context: context,
      builder: (BuildContext ctx) => widget,
    );
  }

  static Future<void> modalBottomSheetBuilder({BuildContext context, Widget widget}) {
    return showModalBottomSheet<dynamic>(
      context: context,
      elevation: 0.0,
      clipBehavior: Clip.hardEdge,
      builder: (BuildContext ctx) => widget,
    );
  }
}
