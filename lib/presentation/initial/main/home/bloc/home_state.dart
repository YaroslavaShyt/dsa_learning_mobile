import 'package:dsa_learning/domain/achievements/iachievement.dart';
import 'package:dsa_learning/domain/achievements/istreak.dart';
import 'package:equatable/equatable.dart';

enum HomeStatus { loading, success, failure }

class HomeState extends Equatable {
  const HomeState({
    this.streak = const [],
    this.status = HomeStatus.loading,
    this.lockedAchievements = const {},
    this.unlockedAchievements = const {},
  });

  HomeState copyWith({
    HomeStatus? status,
    List<IStreak>? streak,
    Set<IAchievement>? lockedAchievements,
    Set<IAchievement>? unlockedAchievements,
  }) {
    return HomeState(
      status: status ?? this.status,
      streak: streak ?? this.streak,
    );
  }

  final HomeStatus status;
  final List<IStreak> streak;
  final Set<IAchievement> lockedAchievements;
  final Set<IAchievement> unlockedAchievements;

  @override
  List<Object?> get props => [
        status,
        streak,
        lockedAchievements,
        unlockedAchievements,
      ];
}
