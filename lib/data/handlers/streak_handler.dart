import 'package:dsa_learning/domain/handlers/istreak_handler.dart';
import 'package:dsa_learning/domain/rewards/achievements/istreak.dart';
import 'package:easy_localization/easy_localization.dart';

class StreakHandler implements IStreakHandler {
  @override
  bool shouldShowLostStreakPopup(List<IStreak> streaks) {
    final DateTime today = DateTime.now();
    final DateTime yesterday = today.subtract(const Duration(days: 1));
    final DateTime dayBeforeYesterday = today.subtract(const Duration(days: 2));

    IStreak? streakFromTwoDaysAgo;
    IStreak? streakFromYesterday;
    IStreak? streakFromToday;

    for (var streak in streaks) {
      if (_isSameDay(streak.date, dayBeforeYesterday)) {
        streakFromTwoDaysAgo = streak;
      } else if (_isSameDay(streak.date, yesterday)) {
        streakFromYesterday = streak;
      } else if (_isSameDay(streak.date, today)) {
        streakFromToday = streak;
      }
    }

    final bool didLearnTwoDaysAgo = streakFromTwoDaysAgo != null &&
        streakFromTwoDaysAgo.status == StreakStatus.learned;

    final bool didMissYesterday = streakFromYesterday != null &&
        streakFromYesterday.status == StreakStatus.notLearned;

    final bool didNotLearnToday = streakFromToday != null &&
        streakFromToday.status == StreakStatus.notLearned;

    return didLearnTwoDaysAgo && didMissYesterday && didNotLearnToday;
  }

  bool _isSameDay(DateTime date1, DateTime date2) {
    final DateFormat format = DateFormat('yyyy-MM-dd');
    return format.format(date1) == format.format(date2);
  }
}
