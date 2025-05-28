import 'package:dsa_learning/data/game/task.dart';
import 'package:dsa_learning/domain/game/igame.dart';
import 'package:dsa_learning/domain/game/itask.dart';

const String _gameId = 'gameId';
const String _gameName = 'gameName';
const String _timeLimit = 'timeLimit';
const String _gameTasks = 'gameTasks';

class Game implements IGame {
  Game({
    required this.id,
    required this.title,
    required this.timeLimit,
    required this.tasksByLevel,
  }) : tasks = tasksByLevel.values.expand((list) => list).toList();

  factory Game.fromJson(Map<String, dynamic> data) {
    final Map<String, dynamic> rawTasksByLevel = data['tasksByLevel'];

    final Map<TaskLevel, List<ITask>> parsedTasksByLevel = {};

    rawTasksByLevel.forEach((levelStr, tasksJson) {
      final TaskLevel level = Task.apiToType(levelStr);
      final List<ITask> taskList = (tasksJson as List)
          .map<ITask>((taskJson) => Task.fromJson(taskJson))
          .toList();
      parsedTasksByLevel[level] = taskList;
    });

    return Game(
      id: data[_gameId],
      title: data[_gameName],
      timeLimit: data[_timeLimit],
      tasksByLevel: parsedTasksByLevel,
    );
  }

  @override
  final int id;

  @override
  final String title;

  @override
  final int timeLimit;

  @override
  final Map<TaskLevel, List<ITask>> tasksByLevel;

  @override
  final List<ITask> tasks;
}
