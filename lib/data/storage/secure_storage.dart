import 'package:dsa_learning/domain/storage/isecure_storage.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';

const String _storageName = 'dsa_learning';
const String _dsa = 'dsa';

class SecureStorage implements ISecureStorage {
  SecureStorage({
    required SharedPreferences sharedPreferences,
  }) : _sharedPreferences = sharedPreferences;

  final FlutterSecureStorage _storage = const FlutterSecureStorage(
    aOptions: AndroidOptions(
      encryptedSharedPreferences: true,
      sharedPreferencesName: _storageName,
      preferencesKeyPrefix: _dsa,
    ),
    iOptions: IOSOptions(
      groupId: _storageName,
      accessibility: KeychainAccessibility.first_unlock_this_device,
    ),
  );

  final SharedPreferences _sharedPreferences;

  @override
  Future<void> create({required String key, required value}) async {
    //await _storage.write(key: key, value: value);
    await _sharedPreferences.setString(key, value);
  }

  @override
  Future<void> delete({required String key}) async {
    //await _storage.delete(key: key);
    await _sharedPreferences.remove(key);
  }

  @override
  Future<String?> read({required String key}) async {
    //  return _storage.read(key: key);
    return _sharedPreferences.getString(key);
  }

  @override
  Future update({required String key, required value}) async {
    // await _storage.write(key: key, value: value);
    await _sharedPreferences.setString(key, value);
  }
}
