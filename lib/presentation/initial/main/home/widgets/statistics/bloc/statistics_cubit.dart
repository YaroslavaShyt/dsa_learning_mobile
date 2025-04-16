import 'package:dsa_learning/core/utils/logging/logger.dart';
import 'package:dsa_learning/domain/statistics/istatistics.dart';
import 'package:dsa_learning/domain/statistics/istatistics_repository.dart';
import 'package:dsa_learning/presentation/initial/main/home/widgets/statistics/bloc/statistics_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class StatisticsCubit extends Cubit<StatisticsState> {
  StatisticsCubit({
    required IStatisticsRepository statisticsRepository,
  })  : _statisticsRepository = statisticsRepository,
        super(const StatisticsState());

  final IStatisticsRepository _statisticsRepository;

  Future<void> init() async {
    try {
      final List<IStatistics> statistics =
          await _statisticsRepository.getStatistics();

      emit(
        state.copyWith(
          statistics: statistics.sublist(statistics.length - 3),
          maxValue: _findMaxValue(),
          userMaxValue: _findMaxValueThroughStatistics(),
        ),
      );
    } catch (error) {
      logger.e(error);
    }
  }

  int _findMaxValue() {
    int max = 10;
    for (IStatistics statistics in state.statistics) {
      if (statistics.dataStructures > max) {
        max = statistics.dataStructures;
      }
      if (statistics.algorithms > max) {
        max = statistics.algorithms;
      }
    }
    return max + 10;
  }

  int _findMaxValueThroughStatistics() {
    int max = 0;
    for (IStatistics statistics in state.statistics) {
      if (statistics.dataStructures > max) {
        max = statistics.dataStructures;
      }
      if (statistics.algorithms > max) {
        max = statistics.algorithms;
      }
    }
    return max;
  }
}
