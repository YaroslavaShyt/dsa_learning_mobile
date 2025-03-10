import 'package:dio/dio.dart';
import 'package:dsa_learning/data/networking/endpoints.dart';
import 'package:dsa_learning/domain/storage/isecure_storage.dart';

class AuthInterceptor extends Interceptor {
  AuthInterceptor({
    required ISecureStorage storage,
  }) : _storage = storage;

  final ISecureStorage _storage;

  @override
  Future<void> onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    if (_isAuthHeaderRequired(options)) {
      final data = await Future.wait([
        _storage.read(key: 'token'),
        _storage.read(key: 'id'),
      ]);
      options.headers['Authorization'] = 'Bearer ${data.first}';
      options.headers['X-User-Id'] = data.last;
    }
    handler.next(options);
  }

  bool _isAuthHeaderRequired(RequestOptions options) {
    return options.uri.path != Endpoints.signInEndpoint &&
        options.uri.path != Endpoints.signUpEndpoint;
  }
}
