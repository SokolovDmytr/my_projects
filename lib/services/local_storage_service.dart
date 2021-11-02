import 'dart:io';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:fridge_yellow_team_bloc/res/const.dart';
import 'package:fridge_yellow_team_bloc/services/user_information_service/user.dart';
import 'package:fridge_yellow_team_bloc/utils/string_util.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart' as path_provider;

class LocalStorageService {
  static const tag = '[StorageService]';

  final FlutterSecureStorage _service = FlutterSecureStorage();

  LocalStorageService._privateConstructor();

  static final LocalStorageService _instance = LocalStorageService._privateConstructor();

  static LocalStorageService get instance => _instance;

  final Map<StorageKeys, String> _keys = {
    StorageKeys.stores: 'stores',
    StorageKeys.acceptedStoreId: 'acceptedStoreId',
    StorageKeys.openedStoreId: 'openedStoreId',
    StorageKeys.isFirstOpen: 'isFirstOpen',
  };

  Future<bool> getValueExistsByKey({required StorageKeys key}) async {
    return await _service.read(key: _keys[key]!) != null;
  }

  Future<String?> getValueByKey({required StorageKeys key}) async {
    try {
      final String? value = await _service.read(
        key: _keys[key]!,
      );

      return value;
    } catch (e) {
      return null;
    }
  }

  Future<void> deleteValueByKey({required StorageKeys key}) async {
    await _service.delete(key: _keys[key]!);
  }

  Future<void> saveValueByKey({
    required StorageKeys key,
    String? value,
  }) async {
    await _service.write(
      key: key.toString(),
      value: value,
    );
  }

  Future<void> initializeStorage() async {
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
  }
}

enum StorageKeys {
  openedStoreId,
  acceptedStoreId,
  isFirstOpen,
  stores,
}
