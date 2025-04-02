import 'package:dsa_learning/domain/statistics/istatistics.dart';
import 'package:equatable/equatable.dart';

class StatisticsState extends Equatable {
  const StatisticsState({
    this.statistics = const [],
    this.maxValue = 10,
  });

  StatisticsState copyWith({
    List<IStatistics>? statistics,
    int? maxValue,
  }) {
    return StatisticsState(
      maxValue: maxValue ?? this.maxValue,
      statistics: statistics ?? this.statistics,
    );
  }

  final List<IStatistics> statistics;
  final int maxValue;

  @override
  List<Object?> get props => [
        statistics,
        maxValue,
      ];
}
