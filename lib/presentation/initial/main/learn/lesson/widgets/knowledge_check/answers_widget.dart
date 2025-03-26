import 'package:dsa_learning/core/utils/theme/app_color_theme.dart';
import 'package:dsa_learning/core/utils/theme/text_theme.dart';
import 'package:dsa_learning/presentation/widgets/main_container.dart';
import 'package:flutter/material.dart';

class AnswersWidget extends StatelessWidget {
  const AnswersWidget({
    required this.answers,
    required this.onTap,
    required this.isSelectedCorrect,
    required this.isSelectedIncorrect,
    required this.selectedAnswer,
    required this.correctAnswer,
    super.key,
  });

  final List<String> answers;
  final Function(String, bool) onTap;
  final bool isSelectedCorrect;
  final bool isSelectedIncorrect;
  final String selectedAnswer;
  final String correctAnswer;

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = getTextTheme(context);
    final ColorScheme colorScheme = getColorScheme(context);

    return Column(
      children: List.generate(
        answers.length,
        (int index) {
          return GestureDetector(
            onTap: selectedAnswer.isEmpty
                ? () => onTap(
                      answers[index],
                      _isSelectedCorrect(answers[index]),
                    )
                : null,
            child: MainContainer(
              showBorder: true,
              borderColor: _isSelected(answers[index])
                  ? _isSelectedCorrect(answers[index])
                      ? colorScheme.primaryFixed
                      : colorScheme.error
                  : null,
              margin: const EdgeInsetsDirectional.only(bottom: 10),
              height: 90,
              padding: const EdgeInsetsDirectional.symmetric(
                horizontal: 20,
                vertical: 10,
              ),
              width: double.infinity,
              content: Row(
                children: [
                  Text(
                    answers[index],
                    style: textTheme.bodyMedium?.copyWith(
                      fontSize: 18,
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  bool _isSelected(String answer) {
    return answer == selectedAnswer;
  }

  bool _isSelectedCorrect(String answer) {
    return answer == correctAnswer;
  }
}
