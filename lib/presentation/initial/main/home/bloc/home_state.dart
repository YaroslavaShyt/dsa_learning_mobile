import 'package:dsa_learning/domain/achievements/iachievement.dart';
import 'package:dsa_learning/domain/achievements/istreak.dart';
import 'package:equatable/equatable.dart';

enum HomeStatus { loading, success, failure }

class HomeState extends Equatable {
  const HomeState({
    this.streak = const [],
    this.status = HomeStatus.loading,
    this.achievements = const [],
  });

  HomeState copyWith({
    HomeStatus? status,
    List<IStreak>? streak,
    List<IAchievement>? achievements,
  }) {
    return HomeState(
      status: status ?? this.status,
      streak: streak ?? this.streak,
      achievements: achievements ?? this.achievements,
    );
  }

  final HomeStatus status;
  final List<IStreak> streak;
  final List<IAchievement> achievements;

  @override
  List<Object?> get props => [
        status,
        streak,
        achievements,
      ];
}
