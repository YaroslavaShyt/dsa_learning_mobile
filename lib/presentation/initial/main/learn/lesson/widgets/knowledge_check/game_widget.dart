import 'package:dsa_learning/domain/game/itask.dart';
import 'package:dsa_learning/presentation/initial/main/learn/lesson/widgets/buttons.dart';
import 'package:dsa_learning/presentation/initial/main/learn/lesson/widgets/knowledge_check/answers_widget.dart';
import 'package:dsa_learning/presentation/initial/main/learn/lesson/widgets/knowledge_check/game_progress_bar.dart';
import 'package:dsa_learning/presentation/initial/main/learn/lesson/widgets/knowledge_check/game_question.dart';
import 'package:flutter/material.dart';

class GameWidget extends StatelessWidget {
  const GameWidget({
    required this.task,
    required this.questionsNum,
    required this.progress,
    required this.gameName,
    required this.onNextButtonTap,
    required this.onBackButtonTap,
    required this.lessonTime,
    required this.onUpdateTimer,
    required this.onAnswerSelected,
    required this.selectedAnswer,
    required this.gameProgress,
    required this.vents,
    super.key,
  });

  final int questionsNum;
  final ITask task;
  final int lessonTime;
  final double progress;
  final String gameName;
  final VoidCallback onNextButtonTap;
  final VoidCallback onBackButtonTap;
  final VoidCallback onUpdateTimer;
  final Function(String, bool) onAnswerSelected;
  final String selectedAnswer;
  final List<bool> gameProgress;
  final int vents;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsetsDirectional.symmetric(
        vertical: 20,
        horizontal: 16,
      ),
      height: MediaQuery.sizeOf(context).height,
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            spacing: 20,
            children: [
              GameProgressBar(
                gameProgress: gameProgress,
                questionsNum: questionsNum,
                time: lessonTime,
                updateTimer: onUpdateTimer,
                value: progress,
                gameName: gameName,
                vents: vents,
              ),
              GameQuestion(
                step: task.questionNumber,
                question: task.question,
              ),
              AnswersWidget(
                correctAnswer: task.correctAnswer,
                selectedAnswer: selectedAnswer,
                onTap: onAnswerSelected,
                isSelectedCorrect: false,
                isSelectedIncorrect: false,
                answers: task.answerOptions,
              ),
            ],
          ),
          Buttons(
            leftButtonText: 'finish',
            isAnswerSelected: selectedAnswer.isNotEmpty,
            onBackButtonTap: onBackButtonTap,
            onNextButtonTap: onNextButtonTap,
          ),
        ],
      ),
    );
  }
}
