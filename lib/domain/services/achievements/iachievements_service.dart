import 'package:dsa_learning/domain/achievements/iachievement.dart';
import 'package:dsa_learning/domain/achievements/istreak.dart';

abstract interface class IAchievementsService {
  Future<void> init();

  Future<void> getStreak();

  List<IStreak> get streak;

  List<IAchievement> get achievements;
}
