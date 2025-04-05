import 'package:dsa_learning/core/constants/image_assets.dart';
import 'package:dsa_learning/domain/rewards/achievements/iachievement.dart';

const String _id = 'achievementId';
const String _title = 'achievementName';
const String _description = 'description';
const String _achievedOn = 'createdAt';

enum AchievementType {
  locked('', ImageAssets.lockedAchievement),
  devotion("devotion", ImageAssets.devotion),
  junior("junior", ImageAssets.junior),
  middle("middle", ImageAssets.middle),
  persistence("persistence", ImageAssets.persistence),
  responsibility("responsibility", ImageAssets.responsibility),
  savvy("savvy", ImageAssets.savyy),
  senior("senior", ImageAssets.senior);

  const AchievementType(
    this.apiString,
    this.image,
  );

  final String apiString;
  final String image;
}

class Achievement implements IAchievement {
  Achievement({
    required this.id,
    required this.title,
    required this.achievedOn,
    required this.description,
    required this.achievementType,
    required this.path,
    required this.isLocked,
  });

  @override
  final DateTime achievedOn;

  @override
  final String description;

  @override
  final String id;

  @override
  final String title;

  @override
  final AchievementType achievementType;

  @override
  final String path;

  @override
  final bool isLocked;

  factory Achievement.fromJson(Map<dynamic, dynamic> json) {
    final AchievementType type = _getAchievementTypeByAPIString(
      json[_title] ?? json['name'],
    );
    final bool isUnlocked =
        json[_achievedOn] != null && json['createdAt'] != null;
    return Achievement(
      id: (json[_id] ?? json['id']).toString(),
      title: json[_title] ?? json['name'],
      achievedOn: isUnlocked
          ? DateTime.parse(json[_achievedOn] ?? json['createdAt'])
          : DateTime.now(),
      description: json[_description] ?? '',
      achievementType: type,
      path: _getImage(type, isUnlocked),
      isLocked: !isUnlocked,
    );
  }

  static AchievementType _getAchievementTypeByAPIString(String apiString) {
    return AchievementType.values.firstWhere(
      (achievement) => achievement.apiString == apiString,
      orElse: () => AchievementType.locked,
    );
  }

  static String _getImage(AchievementType type, bool isUnlocked) {
    if (!isUnlocked) {
      return ImageAssets.lockedAchievement;
    }
    return switch (type) {
      AchievementType.locked => ImageAssets.lockedAchievement,
      AchievementType.devotion => ImageAssets.devotion,
      AchievementType.junior => ImageAssets.junior,
      AchievementType.middle => ImageAssets.middle,
      AchievementType.persistence => ImageAssets.persistence,
      AchievementType.responsibility => ImageAssets.responsibility,
      AchievementType.savvy => ImageAssets.savyy,
      AchievementType.senior => ImageAssets.senior,
    };
  }
}
