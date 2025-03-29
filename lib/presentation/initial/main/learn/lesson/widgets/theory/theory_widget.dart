import 'package:dsa_learning/presentation/initial/main/learn/lesson/widgets/buttons.dart';
import 'package:dsa_learning/presentation/initial/main/learn/lesson/widgets/theory/progress_bar.dart';
import 'package:dsa_learning/presentation/initial/main/learn/lesson/widgets/theory/step_name.dart';
import 'package:dsa_learning/presentation/initial/main/learn/lesson/widgets/theory/theory_content.dart';
import 'package:flutter/material.dart';

class TheoryWidget extends StatelessWidget {
  const TheoryWidget({
    required this.progress,
    required this.lessonName,
    required this.stepName,
    required this.content,
    required this.onNextButtonTap,
    required this.onBackButtonTap,
    required this.lessonTime,
    required this.onUpdateTimer,
    super.key,
  });

  final int lessonTime;
  final double progress;
  final String lessonName;
  final String stepName;
  final String content;
  final VoidCallback onNextButtonTap;
  final VoidCallback onBackButtonTap;
  final VoidCallback onUpdateTimer;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsetsDirectional.symmetric(
        vertical: 20,
        horizontal: 16,
      ),
      child: Column(
        spacing: 20,
        children: [
          ProgressBar(
            time: lessonTime,
            updateTimer: onUpdateTimer,
            lessonName: lessonName,
            value: progress,
          ),
          StepName(stepName: stepName),
          Expanded(
            child: TheoryContent(content: content),
          ),
          Buttons(
            isAnswerSelected: true,
            onNextButtonTap: onNextButtonTap,
            onBackButtonTap: onBackButtonTap,
          ),
        ],
      ),
    );
  }
}
