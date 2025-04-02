import 'package:dsa_learning/domain/rewards/achievements/iachievement.dart';
import 'package:dsa_learning/domain/rewards/achievements/istreak.dart';
import 'package:equatable/equatable.dart';

class AchievementsState extends Equatable {
  const AchievementsState({
    this.streak = const [],
    this.achievements = const [],
  });

  AchievementsState copyWith({
    List<IStreak>? streak,
    List<IAchievement>? achievements,
  }) {
    return AchievementsState(
      streak: streak ?? this.streak,
      achievements: achievements ?? this.achievements,
    );
  }

  final List<IStreak> streak;
  final List<IAchievement> achievements;

  @override
  List<Object?> get props => [
        streak,
        achievements,
      ];
}
