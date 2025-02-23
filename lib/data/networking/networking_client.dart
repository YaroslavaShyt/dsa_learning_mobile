import 'package:dsa_learning/core/constants/system.dart';
import 'package:dsa_learning/data/networking/interceptors/logger_interceptor.dart';
import 'package:dsa_learning/domain/networking/inetworking_client.dart';

import 'dart:convert';
import 'package:dio/dio.dart';

import 'package:dsa_learning/data/networking/endpoints.dart';

class NetworkingClient implements INetworkingClient {
  NetworkingClient() {
    _dio = Dio(
      BaseOptions(
          baseUrl: Endpoints.baseEndpoint,
          connectTimeout: SystemConstants.connectTimeout,
          receiveTimeout: SystemConstants.receiveTimeout,
          headers: {
            'Content-Type': 'application/json; charset=UTF-8',
          },
          responseType: ResponseType.json),
    )..interceptors.addAll([
        LoggerInterceptor(),
      ]);
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
    required Map<String, dynamic> body,
  }) async {
    try {
      return _dio.get(
        endpoint,
        data: jsonEncode(body),
      );
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<Response?> post(
    String endpoint, {
    required Map<String, dynamic> body,
  }) async {
    try {
      return _dio.post(
        endpoint,
        data: jsonEncode(body),
      );
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<Response?> put(
    String endpoint, {
    required Map<String, dynamic> body,
  }) async {
    try {
      return _dio.put(
        endpoint,
        data: jsonEncode(body),
      );
    } catch (e) {
      rethrow;
    }
  }
}
