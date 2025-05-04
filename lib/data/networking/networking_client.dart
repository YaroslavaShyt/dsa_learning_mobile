import 'package:dio/dio.dart';
import 'package:dsa_learning/core/constants/system.dart';
import 'package:dsa_learning/data/networking/endpoints.dart';
import 'package:dsa_learning/data/networking/interceptors/auth_interceptor.dart';
import 'package:dsa_learning/data/networking/interceptors/logger_interceptor.dart';
import 'package:dsa_learning/domain/networking/inetworking_client.dart';
import 'package:dsa_learning/domain/storage/isecure_storage.dart';

class NetworkingClient implements INetworkingClient {
  NetworkingClient({
    required ISecureStorage secureStorage,
  }) {
    _dio = Dio(
      BaseOptions(
        baseUrl: Endpoints.baseEndpoint,
        connectTimeout: SystemConstants.connectTimeout,
        receiveTimeout: SystemConstants.receiveTimeout,
        headers: {
          'Content-Type': 'application/json',
        },
        responseType: ResponseType.json,
      ),
    )
      ..interceptors.addAll(
        [
          LoggerInterceptor(),
          AuthInterceptor(storage: secureStorage),
        ],
      )
      ..transformer = BackgroundTransformer();
  }

  late final Dio _dio;

  @override
  Future<Response?> delete(String endpoint) async {
    try {
      return _dio.delete(endpoint);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<Response?> get(
    String endpoint, {
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic> body = const <String, dynamic>{},
  }) async {
    try {
      return _dio.get(
        endpoint,
        data: body,
        queryParameters: queryParameters,
      );
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<Response?> post(
    String endpoint, {
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? body,
  }) async {
    try {
      return _dio.post(
        endpoint,
        data: body,
        queryParameters: queryParameters,
      );
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<Response?> put(
    String endpoint, {
    Map<String, dynamic>? body,
    Map<String, dynamic>? queryParameters,
  }) async {
    try {
      return _dio.put(
        endpoint,
        data: body,
        queryParameters: queryParameters,
      );
    } catch (e) {
      rethrow;
    }
  }
}
