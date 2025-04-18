import 'package:dsa_learning/domain/rewards/achievements/iachievement.dart';
import 'package:dsa_learning/domain/rewards/achievements/istreak.dart';

abstract interface class IAchievementsRepository {
  Future<List<IAchievement>> getAllAchievements();

  Future<List<IAchievement>> getUserAchievements();

  Future<void> addNewAchievement({
    required List<String> achievementId,
  });

  Future<List<IStreak>> getUserStreak();

  Future<void> updateUserStreak(StreakStatus status, [DateTime? date]);
}
