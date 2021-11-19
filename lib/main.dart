import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:memes/application/application.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);

  runApp(Application());
}
