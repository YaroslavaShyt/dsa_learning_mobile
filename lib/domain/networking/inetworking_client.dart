import 'package:dio/dio.dart';

abstract class INetworkingClient {
  Future<Response?> get(
    String endpoint, {
    required Map<String, String> body,
  });

  Future<Response?> post(
    String endpoint, {
    required Map<String, String> body,
  });

  Future<Response?> put(
    String endpoint, {
    required Map<String, String> body,
  });

  Future<Response?> delete(String endpoint);
}
