import 'package:auto_size_text_plus/auto_size_text_plus.dart';
import 'package:dsa_learning/core/utils/theme/app_color_theme.dart';
import 'package:dsa_learning/core/utils/theme/text_theme.dart';
import 'package:dsa_learning/presentation/widgets/main_container.dart';
import 'package:flutter/material.dart';

final AutoSizeGroup _autoSizeGroup = AutoSizeGroup();

class AnswersWidget extends StatelessWidget {
  const AnswersWidget({
    required this.answers,
    required this.onTap,
    required this.selectedAnswer,
    required this.correctAnswer,
    super.key,
  });

  final List<String> answers;
  final Function(String, bool) onTap;
  final String selectedAnswer;
  final String correctAnswer;

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = getTextTheme(context);
    final ColorScheme colorScheme = getColorScheme(context);

    return SizedBox(
      height: MediaQuery.sizeOf(context).height * 0.5 - 10,
      child: ListView.builder(
        itemCount: answers.length,
        itemBuilder: (BuildContext context, int index) {
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
                  Flexible(
                    child: AutoSizeText(
                      answers[index],
                      group: _autoSizeGroup,
                      maxFontSize: 18,
                      minFontSize: 12,
                      style: textTheme.bodyMedium,
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

  bool _isSelected(String answer) => answer == selectedAnswer;

  bool _isSelectedCorrect(String answer) => answer == correctAnswer;
}
