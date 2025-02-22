import 'package:dsa_learning/domain/storage/isecure_storage.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

const String _storageName = 'dsa_learning';
const String _dsa = 'dsa';

class SecureStorage implements ISecureStorage {
  final FlutterSecureStorage _storage = FlutterSecureStorage(
    aOptions: AndroidOptions(
      encryptedSharedPreferences: true,
      sharedPreferencesName: _storageName,
      preferencesKeyPrefix: _dsa,
    ),
    iOptions: IOSOptions(
      groupId: _storageName,
    ),
  );

  @override
  Future<void> create({required String key, required value}) async {
    await _storage.write(key: key, value: value);
  }

  @override
  Future<void> delete({required String key}) async{
    await _storage.delete(key: key);
  }

  @override
  Future<dynamic> read({required String key}) {
    return _storage.read(key: key);
  }

  @override
  Future update({required String key, required value}) async{
    await _storage.write(key: key, value: value);
  }
}
