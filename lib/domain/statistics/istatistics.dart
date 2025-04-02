abstract interface class IStatistics {
  IStatistics({
    required this.month,
    required this.algorithms,
    required this.dataStructures,
  });

  IStatistics copyWith({
    int? algorithms,
    int? dataStructures,
    String? month,
  });

  final String month;

  final int algorithms;

  final int dataStructures;
}
