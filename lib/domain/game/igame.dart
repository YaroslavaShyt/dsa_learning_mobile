import 'package:dsa_learning/data/game/task.dart';
import 'package:dsa_learning/domain/game/itask.dart';

abstract interface class IGame {
  IGame({
    required this.id,
    required this.title,
    required this.timeLimit,
    required this.tasks,
    required this.tasksByLevel,
  });

  final int id;
  final String title;
  final int timeLimit;
  final List<ITask> tasks;
  final Map<TaskLevel, List<ITask>> tasksByLevel;
}
