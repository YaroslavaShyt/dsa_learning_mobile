import 'package:dsa_learning/domain/auth/iauth_response.dart';

abstract interface class ITokenService {
  Future<String?> getToken();

  Future<bool> saveToken(IAuthResponse token);

  Future<void> clearToken();
}
