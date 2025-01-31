abstract class INetworkingClient {
  Future<Map<String, dynamic>> get(
    String endpoint, {
    Map<String, String>? headers,
    dynamic body,
  });

  Future<Map<String, dynamic>> post(
    String endpoint, {
    Map<String, String>? headers,
    dynamic body,
  });

  Future<Map<String, dynamic>> put(
    String endpoint, {
    Map<String, String>? headers,
    dynamic body,
  });

  Future<Map<String, dynamic>> delete(
    String endpoint, {
    Map<String, String>? headers,
  });
}
