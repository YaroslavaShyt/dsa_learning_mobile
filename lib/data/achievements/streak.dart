import 'package:dsa_learning/domain/achievements/istreak.dart';

const String _apiDate = 'date';
const String _apiStatus = 'status';

class Streak implements IStreak {
  Streak({
    required this.status,
    required this.date,
  });

  @override
  Streak copyWith({
    DateTime? date,
    StreakStatus? status,
  }) {
    return Streak(
      status: status ?? this.status,
      date: date ?? this.date,
    );
  }

  @override
  DateTime date;

  @override
  StreakStatus status;

  factory Streak.fromJson(Map<dynamic, dynamic> json) {
    final String dateString = json[_apiDate]?.toString() ?? '';

    if (dateString.isEmpty) {
      throw ArgumentError('Invalid date string: $dateString');
    }

    return Streak(
      status: _statusFromString(json[_apiStatus]),
      date: DateTime.parse(dateString),
    );
  }

  static StreakStatus _statusFromString(String status) {
    switch (status) {
      case 'LEARNED':
        return StreakStatus.learned;
      case 'NOT_LEARNED':
        return StreakStatus.notLearned;
      case 'FROZEN':
        return StreakStatus.frozen;
      default:
        throw ArgumentError('Invalid status value: $status');
    }
  }
}
