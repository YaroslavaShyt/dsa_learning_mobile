import 'package:dsa_learning/domain/statistics/istatistics.dart';
import 'package:equatable/equatable.dart';

class StatisticsState extends Equatable {
  const StatisticsState({
    this.statistics = const [],
    this.maxValue = 10,
    this.userMaxValue = 0,
  });

  StatisticsState copyWith({
    List<IStatistics>? statistics,
    int? maxValue,
    int? userMaxValue,
  }) {
    return StatisticsState(
      maxValue: maxValue ?? this.maxValue,
      statistics: statistics ?? this.statistics,
      userMaxValue: userMaxValue ?? this.userMaxValue,
    );
  }

  final List<IStatistics> statistics;
  final int maxValue;
  final int userMaxValue;

  @override
  List<Object?> get props => [
        statistics,
        maxValue,
        userMaxValue,
      ];
}
