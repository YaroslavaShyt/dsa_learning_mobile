import 'package:dsa_learning/domain/rewards/achievements/iachievement.dart';
import 'package:dsa_learning/domain/rewards/achievements/istreak.dart';
import 'package:equatable/equatable.dart';

enum HomeStatus { loading, success, failure }

class HomeState extends Equatable {
  const HomeState({
    this.streak = const [],
    this.status = HomeStatus.loading,
    this.achievements = const [],
    this.userName = '',
    this.hash = 0,
    this.bytes = 0,
    this.vent = 0,
    this.profilePhoto = '',
  });

  HomeState copyWith({
    HomeStatus? status,
    List<IStreak>? streak,
    List<IAchievement>? achievements,
    String? userName,
    int? bytes,
    int? hash,
    int? vent,
    String? profilePhoto,
  }) {
    return HomeState(
      status: status ?? this.status,
      streak: streak ?? this.streak,
      achievements: achievements ?? this.achievements,
      userName: userName ?? this.userName,
      bytes: bytes ?? this.bytes,
      hash: hash ?? this.hash,
      vent: vent ?? this.vent,
      profilePhoto: profilePhoto ?? this.profilePhoto,
    );
  }

  final HomeStatus status;
  final List<IStreak> streak;
  final List<IAchievement> achievements;
  final String userName;
  final int bytes;
  final int hash;
  final int vent;
  final String profilePhoto;

  @override
  List<Object?> get props => [
        status,
        streak,
        achievements,
        userName,
        bytes,
        hash,
        vent,
        profilePhoto,
      ];
}
