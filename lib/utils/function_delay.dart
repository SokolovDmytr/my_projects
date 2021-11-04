import 'dart:async';
import 'dart:ui';

import 'package:flutter/material.dart';

class FunctionDelay {
  final Duration duration;
  Timer? _timer;

  FunctionDelay({
    required this.duration,
  });

  void run(VoidCallback action) {
    if (_timer != null) {
      _timer!.cancel();
    }
    _timer = Timer(
      duration,
      action,
    );
  }
}