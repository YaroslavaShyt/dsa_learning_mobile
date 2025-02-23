import 'package:dio/dio.dart';
import 'package:dsa_learning/domain/storage/isecure_storage.dart';

class AuthInterceptor extends Interceptor{
  AuthInterceptor({
    required ISecureStorage storage,
}): _storage = storage;

  final ISecureStorage _storage;

  @override
  Future<void> onRequest(RequestOptions options, RequestInterceptorHandler handler) async{
    if(_isAuthHeaderRequired(options)){
      options.headers['Authorization'] = await _storage.read(key: '');
    }
  }

  bool _isAuthHeaderRequired(RequestOptions options){
    return options.method == 'GET';
  }
}