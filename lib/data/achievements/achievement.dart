import 'package:dsa_learning/domain/achievements/iachievement.dart';

const String _id = 'id';
const String _title = 'title';
const String _description = 'description';
const String _achievedOn = 'achieved';

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

  Achievement fromJson(Map<String, dynamic> json) {
    return Achievement(
      id: json[_id],
      title: json[_title],
      achievedOn: json[_achievedOn],
      description: json[_description],
    );
  }
}
