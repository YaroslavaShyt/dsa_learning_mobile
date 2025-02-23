abstract interface class ITokenService {
  Future<String?> getToken();

  Future<bool> saveToken(String token);

  Future<void> clearToken();
}
