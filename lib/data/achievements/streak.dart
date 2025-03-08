import 'package:dsa_learning/domain/achievements/istreak.dart';

const String _apiDate = 'date';
const String _apiStatus = 'status';

class Streak implements IStreak {
  Streak({
    required this.status,
    required this.date,
  });

  @override
  DateTime date;

  @override
  StreakStatus status;

  factory Streak.fromJson(Map<dynamic, dynamic> json) {
    print(json);
    // Check if the date is a string and parse it, or handle differently
    String dateString = json[_apiDate]?.toString() ?? '';

    // Ensure that we have a valid date string
    if (dateString.isEmpty) {
      throw ArgumentError('Invalid date string: $dateString');
    }

    print(DateTime.parse(dateString)); // this is the correct place to parse

    return Streak(
      status: _statusFromString(json[_apiStatus]),
      date: DateTime.parse(dateString), // Ensure the date is parsed correctly
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
