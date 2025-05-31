import 'package:dsa_learning/core/utils/theme/app_color_theme.dart';
import 'package:dsa_learning/domain/game/itask.dart';
import 'package:dsa_learning/presentation/initial/main/learn/lesson/widgets/buttons.dart';
import 'package:dsa_learning/presentation/initial/main/learn/lesson/widgets/knowledge_check/answers_widget.dart';
import 'package:dsa_learning/presentation/initial/main/learn/lesson/widgets/knowledge_check/game_progress_bar.dart';
import 'package:dsa_learning/presentation/initial/main/learn/lesson/widgets/knowledge_check/game_question.dart';
import 'package:dsa_learning/presentation/widgets/snack_bar.dart';
import 'package:flutter/material.dart';

class GameWidget extends StatefulWidget {
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
  State<GameWidget> createState() => _GameWidgetState();
}

class _GameWidgetState extends State<GameWidget> {
  bool _snackBarShown = false;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    if (!_snackBarShown) {
      WidgetsBinding.instance.addPostFrameCallback(
        (_) {
          ScaffoldMessenger.of(context).showSnackBar(
            MainSnackBar(
              text: 'Модуль зараховується, якщо зроблено не більше 2 помилок.',
              color: getColorScheme(context).surface,
            ),
          );
        },
      );

      _snackBarShown = true;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsetsDirectional.symmetric(
        vertical: 20,
        horizontal: 16,
      ),
      height: MediaQuery.sizeOf(context).height,
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              spacing: 10,
              children: [
                GameProgressBar(
                  gameProgress: widget.gameProgress,
                  questionsNum: widget.questionsNum,
                  time: widget.lessonTime,
                  updateTimer: widget.onUpdateTimer,
                  value: widget.progress,
                  gameName: widget.gameName,
                  vents: widget.vents,
                ),
                GameQuestion(
                  step: widget.task.questionNumber,
                  question: widget.task.question,
                  level: widget.task.taskLevel,
                ),
                AnswersWidget(
                  correctAnswer: widget.task.correctAnswer,
                  selectedAnswer: widget.selectedAnswer,
                  onTap: widget.onAnswerSelected,
                  answers: widget.task.answerOptions,
                ),
              ],
            ),
            Buttons(
              leftButtonText: 'finish',
              isAnswerSelected: widget.selectedAnswer.isNotEmpty,
              onBackButtonTap: widget.onBackButtonTap,
              onNextButtonTap: widget.onNextButtonTap,
            ),
          ],
        ),
      ),
    );
  }
}
