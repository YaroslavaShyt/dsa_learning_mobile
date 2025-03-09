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
  List<IAchievement> _allAchievements = [];

  @override
  Future<void> init() async {
    try {
      final data = await Future.wait([
        _achievementsRepository.getAllAchievements(),
        _achievementsRepository.getUserAchievements(),
        _achievementsRepository.getUserStreak(),
      ]);
      _allAchievements = data[0] as List<IAchievement>;
      _userAchievements = data[1] as List<IAchievement>;
      _streak = data[2] as List<IStreak>;
      _getUserAchievements();
      _getLockedAchievements();
    } catch (error) {
      print("logger achievements service:");
      logger.e(error);
    }
  }

  void _getUserAchievements() {
    for (var achievement in _allAchievements) {
      for (var usrAchievement in _userAchievements) {
        if (usrAchievement.achievementType == achievement.achievementType) {
          _achievements.add(usrAchievement);
        }
      }
    }
  }

  void _getLockedAchievements() {
    for (var achievement in _allAchievements) {
      for (var userAchievement in _userAchievements) {
        if (userAchievement.achievementType != achievement.achievementType) {
          _achievements.add(achievement);
        }
      }
      // if (!_userAchievements.contains(achievement)) {
      //   _achievements.add(achievement);
      // }
    }
  }

  @override
  Future<void> getStreak() {
    // TODO: implement getStreak
    throw UnimplementedError();
  }
}
