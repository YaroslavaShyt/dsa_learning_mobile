import 'package:dsa_learning/domain/achievements/iachievement.dart';

const String _id = 'achievementId';
const String _title = 'achievementName';
const String _description = 'description';
const String _achievedOn = 'createdAt';

class Achievement implements IAchievement {
  Achievement({
    required this.id,
    required this.title,
    required this.achievedOn,
    required this.description,
  });

  @override
  final DateTime achievedOn;

  @override
  final String description;

  @override
  final String id;

  @override
  final String title;

  factory Achievement.fromJson(Map<dynamic, dynamic> json) {
    return Achievement(
      id: (json[_id] ?? json['id']).toString(),
      title: json[_title] ?? json['name'],
      achievedOn: json[_achievedOn] != null && json['createdAt'] != null
          ? DateTime.parse(json[_achievedOn] ?? json['createdAt'])
          : DateTime.now(),
      description: json[_description] ?? '',
    );
  }
}
