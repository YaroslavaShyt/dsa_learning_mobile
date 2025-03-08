import 'package:dsa_learning/core/utils/logging/logger.dart';
import 'package:dsa_learning/domain/achievements/iachievement.dart';
import 'package:dsa_learning/domain/achievements/iachievements_repository.dart';
import 'package:dsa_learning/domain/achievements/istreak.dart';
import 'package:dsa_learning/domain/services/achievements/iachievements_service.dart';

class AchievementsService implements IAchievementsService {
  AchievementsService({
    required IAchievementsRepository achievementsRepository,
  }) : _achievementsRepository = achievementsRepository;

  final IAchievementsRepository _achievementsRepository;

  @override
  List<IStreak> get streak => _streak;
  List<IStreak> _streak = [];

  @override
  Set<IAchievement> get lockedAchievements => _lockedAchievements;
  Set<IAchievement> _lockedAchievements = {};

  @override
  Set<IAchievement> get unlockedAchievements => _unlockedAchievements;
  Set<IAchievement> _unlockedAchievements = {};

  @override
  Future<void> init() async {
    try {
      final data = await Future.wait([
        _achievementsRepository.getAllAchievements(),
        _achievementsRepository.getUserAchievements(),
        _achievementsRepository.getUserStreak(),
      ]);
      _streak = data[2] as List<IStreak>;
    } catch (error) {
      print("logger achievements service:");
      logger.e(error);
    }
  }

  void _processAchievements(List<IAchievement> allAchievements) {
    allAchievements.forEach(
      (IAchievement achievement) {},
    );
  }

  @override
  Future<void> getStreak() {
    // TODO: implement getStreak
    throw UnimplementedError();
  }
}
