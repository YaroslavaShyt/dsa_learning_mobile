abstract interface class IAchievement {
  IAchievement({
    required this.id,
    required this.title,
    required this.description,
    required this.achievedOn,
  });

  final String id;

  final String title;

  final String description;

  final DateTime achievedOn;
}
