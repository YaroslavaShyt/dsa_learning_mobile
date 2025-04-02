import 'package:easy_localization/easy_localization.dart';

enum StreakStatus { learned, frozen, notLearned }

abstract interface class IStreak {
  IStreak({
    required this.status,
    required this.date,
  });

  IStreak copyWith({
    DateTime? date,
    StreakStatus? status,
  });

  final StreakStatus status;

  final DateTime date;
}

bool shouldShowLostStreakPopup(List<IStreak> streaks) {
  final today = DateTime.now();
  final yesterday = today.subtract(const Duration(days: 1));
  final dayBeforeYesterday = today.subtract(const Duration(days: 2));

  IStreak? streakFromTwoDaysAgo;
  IStreak? streakFromYesterday;
  IStreak? streakFromToday;

  for (var streak in streaks) {
    if (isSameDay(streak.date, dayBeforeYesterday)) {
      streakFromTwoDaysAgo = streak;
    } else if (isSameDay(streak.date, yesterday)) {
      streakFromYesterday = streak;
    } else if (isSameDay(streak.date, today)) {
      streakFromToday = streak;
    }
  }

  return (streakFromTwoDaysAgo != null &&
          streakFromTwoDaysAgo.status == StreakStatus.learned) &&
      (streakFromYesterday != null &&
          streakFromYesterday.status == StreakStatus.notLearned) &&
      (streakFromToday != null &&
          streakFromToday.status == StreakStatus.notLearned);
}

bool isSameDay(DateTime date1, DateTime date2) {
  return DateFormat('yyyy-MM-dd').format(date1) ==
      DateFormat('yyyy-MM-dd').format(date2);
}
