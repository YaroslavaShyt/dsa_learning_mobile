import 'package:dsa_learning/domain/storage/ilocal_storage.dart';

abstract interface class ISecureStorage implements ILocalStorage {
  @override
  Future<String?> read({
    required String key,
  });
}
