import 'dart:io';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:fridge_yellow_team_bloc/application/application.dart';
import 'package:fridge_yellow_team_bloc/res/app_styles/app_colors.dart';
import 'package:fridge_yellow_team_bloc/res/const.dart';
import 'package:fridge_yellow_team_bloc/services/user_information_service/user.dart';
import 'package:fridge_yellow_team_bloc/ui/pages/notification_page/cubit/notification_page_cubit.dart';
import 'package:fridge_yellow_team_bloc/utils/string_util.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart' as path_provider;

Future<void> backgroundMessageHandler(RemoteMessage message) async {
  print('received message');
}

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  FirebaseMessaging.onBackgroundMessage(backgroundMessageHandler);

  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle(
      statusBarColor: AppColors.white,
      statusBarIconBrightness: Brightness.dark,
    ),
  );

  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);

  final Directory directory = await path_provider.getApplicationDocumentsDirectory();
  final FlutterSecureStorage storage = FlutterSecureStorage();
  final String? value = await storage.read(key: secureNameKey);

  Hive.init(directory.path);
  List<int> secureKey;
  if (value == null) {
    secureKey = Hive.generateSecureKey();
    await storage.write(
      key: secureNameKey,
      value: secureKey.toString(),
    );
  } else {
    secureKey = StringUtil.parseString(string: value);
  }

  Hive.registerAdapter(UserAdapter());
  await Hive.openBox<User>(hiveBoxNameUser);

  runApp(
    BlocProvider(
      create: (_) => NotificationPageCubit(),
      child: Application(),
    ),
  );
}
