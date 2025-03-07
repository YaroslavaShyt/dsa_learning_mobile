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
      RequestOptions options, RequestInterceptorHandler handler) async {
    if (_isAuthHeaderRequired(options)) {
      final String? token = await _storage.read(key: 'token');
      options.headers['Authorization'] = 'Bearer $token';
    }
    handler.next(options);
  }

  bool _isAuthHeaderRequired(RequestOptions options) {
    return options.uri.path != Endpoints.signInEndpoint &&
        options.uri.path != Endpoints.signUpEndpoint;
  }
}
