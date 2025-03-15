import 'package:dsa_learning/domain/auth/iauth_response.dart';
import 'package:dsa_learning/domain/services/auth/itoken_service.dart';
import 'package:dsa_learning/domain/storage/isecure_storage.dart';

const String _token = 'token';
const String _id = 'id';

class TokenService implements ITokenService {
  TokenService({
    required ISecureStorage storage,
  }) : _storage = storage;

  final ISecureStorage _storage;

  @override
  Future<String?> getToken() async {
    return await _storage.read(key: _token);
  }

  @override
  Future<void> clearToken() async {
    await Future.wait([
      _storage.delete(key: _token),
      _storage.delete(key: _id),
    ]);
  }

  @override
  Future<bool> saveToken(IAuthResponse token) async {
    try {
      await Future.wait([
        _storage.create(key: _token, value: token.token),
        _storage.create(key: _id, value: token.userId.toString())
      ]);
      return true;
    } catch (error) {
      print(error);
    }
    return false;
  }
}
