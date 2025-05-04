import 'package:dsa_learning/domain/game/game_answers_type.dart';

abstract interface class ITask {
  ITask({
    required this.id,
    required this.type,
    required this.question,
    required this.answerOptions,
    required this.correctAnswer,
    required this.questionNumber,
  });

  final int id;
  final String question;
  final int questionNumber;
  final String correctAnswer;
  final GameAnswersType type;
  final List<String> answerOptions;
}
