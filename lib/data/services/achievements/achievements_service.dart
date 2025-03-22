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
  List<IAchievement> get achievements => _achievements;
  List<IAchievement> _achievements = [];

  List<IAchievement> _userAchievements = [];

  @override
  Future<void> init() async {
    try {
      final List<List<Object>> data = await Future.wait([
        _achievementsRepository.getAllAchievements(),
        _achievementsRepository.getUserAchievements(),
        _achievementsRepository.getUserStreak(),
      ]);

      _achievements = data[0] as List<IAchievement>;
      _userAchievements = data[1] as List<IAchievement>;
      _streak = data[2] as List<IStreak>;

      _getUserAchievements();
    } catch (error) {
      logger.e(error);
    }
  }

  void _getUserAchievements() {
    _achievements.map(
      (element) {
        for (var achievement in _userAchievements) {
          if (achievement.achievementType == element.achievementType) {
            return achievement;
          }
        }
      },
    );
  }
}
