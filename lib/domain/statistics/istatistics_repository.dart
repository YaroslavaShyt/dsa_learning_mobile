import 'package:dsa_learning/domain/statistics/istatistics.dart';

abstract interface class IStatisticsRepository {
  Future<List<IStatistics>> getStatistics();
}
