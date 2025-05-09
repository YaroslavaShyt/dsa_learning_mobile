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
    required this.tasks,
  });

  factory Game.fromJson(Map<String, dynamic> data) {
    final List<ITask> tasks =
        data[_gameTasks].map<ITask>((task) => Task.fromJson(task)).toList();

    return Game(
      id: data[_gameId],
      title: data[_gameName],
      timeLimit: data[_timeLimit],
      tasks: tasks,
    );
  }

  @override
  final int id;

  @override
  final String title;

  @override
  final int timeLimit;

  @override
  final List<ITask> tasks;
}
