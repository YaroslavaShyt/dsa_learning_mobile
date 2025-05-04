import 'package:dio/dio.dart';
import 'package:dsa_learning/core/exceptions/user_not_found_exception.dart';
import 'package:dsa_learning/data/networking/endpoints.dart';
import 'package:dsa_learning/domain/storage/isecure_storage.dart';

const String _token = 'token';
const String _id = 'id';

const String _authorization = 'Authorization';
const String _bearer = 'Bearer';
const String _xUserId = 'X-User-Id';

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
      final data = await Future.wait(
        [
          _storage.read(key: _token),
          _storage.read(key: _id),
        ],
      );

      options.headers[_authorization] = '$_bearer ${data.first}';
      options.headers[_xUserId] =
          data.last != null ? int.parse(data.last!) : data.last;
    }
    handler.next(options);
  }

  bool _isAuthHeaderRequired(RequestOptions options) {
    return options.path != Endpoints.signInEndpoint &&
        options.path != Endpoints.signUpEndpoint;
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    if (err.response?.statusCode == 401) throw UserNotFoundException();

    return super.onError(err, handler);
  }
}
