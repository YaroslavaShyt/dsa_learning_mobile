import 'package:dsa_learning/data/rewards/achievements/achievement.dart';
import 'package:dsa_learning/domain/rewards/achievements/iachievement.dart';
import 'package:dsa_learning/domain/rewards/achievements/istreak.dart';

abstract interface class IAchievementsService {
  Future<void> init();

  Future<void> updateStreak();

  Future<void> addAchievement(List<AchievementType> achievements);

  List<IStreak> get streak;

  List<IAchievement> get achievements;

  void updateStreakWithHash();
}
