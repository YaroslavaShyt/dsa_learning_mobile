import 'package:dio/dio.dart';
import 'package:dsa_learning/core/utils/logging/logger.dart';
import 'package:dsa_learning/data/networking/endpoints.dart';
import 'package:dsa_learning/data/statistics/statistics.dart';
import 'package:dsa_learning/domain/networking/inetworking_client.dart';
import 'package:dsa_learning/domain/statistics/istatistics.dart';
import 'package:dsa_learning/domain/statistics/istatistics_repository.dart';

class StatisticsRepository implements IStatisticsRepository {
  StatisticsRepository({
    required INetworkingClient networkingClient,
  }) : _networkingClient = networkingClient;

  final INetworkingClient _networkingClient;

  @override
  Future<List<IStatistics>> getStatistics() async {
    try {
      final Response? response = await _networkingClient.get(
        Endpoints.statisticsEndpoint,
      );

      if (response == null) return [];

      if (response.statusCode == 200) {
        return List<IStatistics>.from(
          response.data.values.map(
            (item) => Statistics.fromJson(
              int.parse(
                (response.data as Map<String, dynamic>).keys.firstWhere(
                      (key) => response.data[key] == item,
                      orElse: () => '0',
                    ),
              ),
              item,
            ),
          ),
        );
      }
    } catch (error) {
      logger.e(error);
      rethrow;
    }
    return [];
  }
}
