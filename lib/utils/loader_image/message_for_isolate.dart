import 'dart:isolate';

import 'package:flutter/material.dart';

class MessageForIsolate {
  final Map<String, String> urls;
  final SendPort sendPort;

  const MessageForIsolate({
    @required this.urls,
    @required this.sendPort,
  });
}