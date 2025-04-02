import 'package:dsa_learning/domain/statistics/istatistics.dart';
import 'package:easy_localization/easy_localization.dart';

const String _apiStringAlgorithms = 'ALGORITHMS';
const String _apiStringDataStructures = 'DATA_STRUCTURES';

class Statistics implements IStatistics {
  Statistics({
    required this.month,
    required this.algorithms,
    required this.dataStructures,
  });

  @override
  Statistics copyWith({
    int? algorithms,
    int? dataStructures,
    String? month,
  }) {
    return Statistics(
      month: month ?? this.month,
      algorithms: algorithms ?? this.algorithms,
      dataStructures: dataStructures ?? this.dataStructures,
    );
  }

  factory Statistics.fromJson(int month, Map<String, dynamic> data) {
    return Statistics(
      month: _getMonthName(month),
      algorithms: data[_apiStringAlgorithms],
      dataStructures: data[_apiStringDataStructures],
    );
  }

  @override
  final int algorithms;

  @override
  final int dataStructures;

  @override
  final String month;

  static String _getMonthName(int monthIndex) {
    return DateFormat('MMMM').format(DateTime(2021, monthIndex));
  }
}
