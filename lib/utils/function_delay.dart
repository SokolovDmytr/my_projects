import 'dart:async';
import 'dart:ui';

import 'package:flutter/material.dart';

class FunctionDelay {
  final Duration duration;
  Timer? timer;

  FunctionDelay({
    required this.duration,
  });

  void run(VoidCallback action) {
    if (timer != null) {
      timer!.cancel();
    }
    timer = Timer(
      duration,
      action,
    );
  }
}