import 'package:dsa_learning/domain/game/itask.dart';
import 'package:dsa_learning/presentation/initial/main/learn/lesson/widgets/buttons.dart';
import 'package:dsa_learning/presentation/initial/main/learn/lesson/widgets/knowledge_check/answers_widget.dart';
import 'package:dsa_learning/presentation/initial/main/learn/lesson/widgets/knowledge_check/game_progress_bar.dart';
import 'package:dsa_learning/presentation/initial/main/learn/lesson/widgets/knowledge_check/game_question.dart';
import 'package:flutter/material.dart';

class GameWidget extends StatelessWidget {
  const GameWidget({
    required this.task,
    required this.progress,
    required this.gameName,
    required this.stepName,
    required this.question,
    required this.onNextButtonTap,
    required this.onBackButtonTap,
    required this.lessonTime,
    required this.onUpdateTimer,
    required this.onAnswerSelected,
    super.key,
  });

  final ITask task;
  final int lessonTime;
  final double progress;
  final String gameName;
  final String stepName;
  final String question;
  final VoidCallback onNextButtonTap;
  final VoidCallback onBackButtonTap;
  final VoidCallback onUpdateTimer;
  final VoidCallback onAnswerSelected;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsetsDirectional.symmetric(
        vertical: 20,
        horizontal: 16,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            spacing: 20,
            children: [
              GameProgressBar(
                time: lessonTime,
                updateTimer: onUpdateTimer,
                value: progress,
                gameName: gameName,
              ),
              GameQuestion(
                step: task.questionNumber,
                question: task.question,
              ),
              AnswersWidget(
                onTap: onAnswerSelected,
                isSelectedCorrect: false,
                isSelectedIncorrect: false,
                answers: task.answerOptions,
              ),
            ],
          ),
          Buttons(
            onBackButtonTap: onBackButtonTap,
            onNextButtonTap: onNextButtonTap,
          ),
        ],
      ),
    );
  }
}
