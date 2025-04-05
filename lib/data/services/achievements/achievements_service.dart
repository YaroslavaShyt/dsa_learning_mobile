import 'package:dsa_learning/core/utils/logging/logger.dart';
import 'package:dsa_learning/data/rewards/achievements/achievement.dart';
import 'package:dsa_learning/data/services/achievements/achievemens_state.dart';
import 'package:dsa_learning/domain/rewards/achievements/iachievement.dart';
import 'package:dsa_learning/domain/rewards/achievements/iachievements_repository.dart';
import 'package:dsa_learning/domain/rewards/achievements/istreak.dart';
import 'package:dsa_learning/domain/services/achievements/iachievements_service.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AchievementsService extends Cubit<AchievementsState>
    implements IAchievementsService {
  AchievementsService({
    required IAchievementsRepository achievementsRepository,
  })  : _achievementsRepository = achievementsRepository,
        super(const AchievementsState());

  final IAchievementsRepository _achievementsRepository;

  @override
  List<IStreak> get streak => _streak;
  List<IStreak> _streak = [];

  @override
  List<IAchievement> get achievements => _achievements;
  List<IAchievement> _achievements = [];

  List<IAchievement> _userAchievements = [];

  bool _wasStreakUpdatedToday = false;

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

      emit(state.copyWith(streak: _streak, achievements: _achievements));
    } catch (error) {
      logger.e(error);
    }
  }

  @override
  Future<void> updateStreak() async {
    try {
      if (_wasStreakUpdatedToday) return;

      await _achievementsRepository.updateUserStreak(StreakStatus.learned);
      _streak = await _achievementsRepository.getUserStreak();

      _wasStreakUpdatedToday = true;
      emit(state.copyWith(streak: _streak));
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

  @override
  void updateStreakWithHash() {
    final int index = _streak.indexWhere(
      (streak) => DateTime.now().day - streak.date.day == 1,
    );

    _streak[index] = _streak[index].copyWith(status: StreakStatus.frozen);
    _achievementsRepository.updateUserStreak(
      StreakStatus.frozen,
      _streak[index].date,
    );
  }

  @override
  Future<void> addAchievement(List<AchievementType> achievements) async {
    try {
      for (var userAchievement in _achievements) {
        for (var requestedAchievement in achievements) {
          if (userAchievement.achievementType == requestedAchievement) {
            achievements
                .removeWhere((a) => a == userAchievement.achievementType);
          }
        }
      }

      await _achievementsRepository.addNewAchievement(
        achievementId:
            _achievements.map((achievement) => achievement.id).toList(),
      );

      await init();
    } catch (error) {
      logger.e(error);
    }
  }
}
