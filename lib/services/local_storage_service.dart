import 'package:flutter_secure_storage/flutter_secure_storage.dart';

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
}

enum StorageKeys {
  openedStoreId,
  acceptedStoreId,
  isFirstOpen,
  stores,
}
