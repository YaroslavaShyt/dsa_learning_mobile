import 'package:dsa_learning/data/achievements/achievement.dart';

abstract interface class IAchievement {
  IAchievement({
    required this.id,
    required this.title,
    required this.description,
    required this.achievedOn,
    required this.achievementType,
    required this.path,
    required this.isLocked,
  });

  final String id;

  final String title;

  final String description;

  final DateTime achievedOn;

  final AchievementType achievementType;

  final String path;

  final bool isLocked;
}
