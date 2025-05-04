enum StreakStatus { learned, frozen, notLearned }

abstract interface class IStreak {
  IStreak({
    required this.status,
    required this.date,
  });

  IStreak copyWith({
    DateTime? date,
    StreakStatus? status,
  });

  final StreakStatus status;

  final DateTime date;
}
