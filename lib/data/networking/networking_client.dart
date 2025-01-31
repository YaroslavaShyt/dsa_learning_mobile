import 'package:dsa_learning/domain/networking/inetworking_client.dart';

import 'dart:convert';
import 'package:dio/dio.dart';

class NetworkingClient implements INetworkingClient {
  NetworkingClient() {
    _dio = Dio();
  }

  late final Dio _dio;

  @override
  Future<Map<String, dynamic>> delete(
    String endpoint, {
    Map<String, String>? headers,
  }) async {
    try {
      final response = await _dio.delete(
        endpoint,
        options: Options(headers: headers),
      );
      return _processResponse(response);
    } catch (e) {
      throw Exception('Error while deleting data: $e');
    }
  }

  @override
  Future<Map<String, dynamic>> get(
    String endpoint, {
    Map<String, String>? headers,
    body,
  }) async {
    try {
      final response = await _dio.get(
        endpoint,
        options: Options(headers: headers),
      );
      return _processResponse(response);
    } catch (e) {
      throw Exception('Error while fetching data: $e');
    }
  }

  @override
  Future<Map<String, dynamic>> post(
    String endpoint, {
    Map<String, String>? headers,
    body,
  }) async {
    try {
      final response = await _dio.post(
        endpoint,
        data: body != null ? jsonEncode(body) : null,
        options: Options(headers: headers),
      );
      return _processResponse(response);
    } catch (e) {
      throw Exception('Error while posting data: $e');
    }
  }

  @override
  Future<Map<String, dynamic>> put(
    String endpoint, {
    Map<String, String>? headers,
    body,
  }) async {
    try {
      final response = await _dio.put(
        endpoint,
        data: body != null ? jsonEncode(body) : null,
        options: Options(headers: headers),
      );
      return _processResponse(response);
    } catch (e) {
      throw Exception('Error while updating data: $e');
    }
  }

  Map<String, dynamic> _processResponse(Response response) {
    if (response.statusCode != null &&
        response.statusCode! >= 200 &&
        response.statusCode! < 300) {
      return response.data != null
          ? Map<String, dynamic>.from(response.data)
          : {};
    } else {
      throw Exception('Request failed with status: ${response.statusCode}');
    }
  }
}
