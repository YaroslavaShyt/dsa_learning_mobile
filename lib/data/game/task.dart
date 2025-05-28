import 'package:dsa_learning/domain/game/game_answers_type.dart';
import 'package:dsa_learning/domain/game/itask.dart';

const String _taskId = 'taskId';
const String _questionNumber = 'questionNumber';
const String _question = 'question';
const String _answerOptions = 'answerOptions';
const String _correctAnswer = 'correctAnswer';
const String _gameAnswersType = 'gameAnswersTypeId';
const String _taskLevel = 'taskLevel';

enum TaskLevel {
  easy("EASY"),
  medium("MEDIUM"),
  hard("HARD");

  const TaskLevel(this.apiString);

  final String apiString;
}

class Task implements ITask {
  Task({
    required this.id,
    required this.questionNumber,
    required this.question,
    required this.answerOptions,
    required this.correctAnswer,
    required this.type,
    required this.taskLevel,
  });

  factory Task.fromJson(Map<String, dynamic> data) {
    return Task(
      id: data[_taskId],
      question: data[_question],
      correctAnswer: data[_correctAnswer],
      questionNumber: data[_questionNumber],
      answerOptions: List<String>.from(data[_answerOptions]),
      type: GameAnswersType.apiToType(data[_gameAnswersType].toString()),
      taskLevel: apiToType(data[_taskLevel]),
    );
  }

  static TaskLevel apiToType(String apiString) {
    return switch (apiString) {
      'EASY' => TaskLevel.easy,
      'MEDIUM' => TaskLevel.medium,
      'HARD' => TaskLevel.hard,
      _ => TaskLevel.easy,
    };
  }

  @override
  final int id;

  @override
  final int questionNumber;

  @override
  final String question;

  @override
  final List<String> answerOptions;

  @override
  final String correctAnswer;

  @override
  final GameAnswersType type;

  @override
  final TaskLevel taskLevel;
}
