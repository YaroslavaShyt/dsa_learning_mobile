abstract interface class ITokenService {
  Future<bool> saveToken(String token);

  Future<void> clearToken();
}
