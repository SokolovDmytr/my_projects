import 'dart:isolate';

class MessageForIsolate {
  final Map<String, String> urls;
  final SendPort sendPort;

  const MessageForIsolate({
    required this.urls,
    required this.sendPort,
  });
}
