enum StreakStatus { learned, frozen, notLearned }

abstract interface class IStreak {
  IStreak({
    required this.status,
    required this.date,
  });

  final StreakStatus status;

  final DateTime date;
}
