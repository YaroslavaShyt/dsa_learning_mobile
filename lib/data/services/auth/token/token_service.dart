import 'package:dsa_learning/domain/services/auth/itoken_service.dart';
import 'package:dsa_learning/domain/storage/isecure_storage.dart';

const String _token = 'token';

class TokenService implements ITokenService {
  TokenService({
    required ISecureStorage storage,
  }) : _storage = storage;

  final ISecureStorage _storage;

  @override
  Future<String?> getToken() async {
    return await _storage.read(key: _token) as String?;
  }

  @override
  Future<void> clearToken() async {
    await _storage.delete(key: _token);
  }

  @override
  Future<bool> saveToken(String token) async {
    try {
      await _storage.create(key: _token, value: token);
      return true;
    } catch (error) {}
    return false;
  }
}
