import 'package:dsa_learning/domain/rewards/achievements/istreak.dart';

abstract interface class IStreakHandler {
  bool shouldShowLostStreakPopup(List<IStreak> streaks);
}
