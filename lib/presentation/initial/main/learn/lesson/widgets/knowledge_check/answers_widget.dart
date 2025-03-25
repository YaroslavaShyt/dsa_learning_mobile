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
    super.key,
  });

  final List<String> answers;
  final VoidCallback onTap;
  final bool isSelectedCorrect;
  final bool isSelectedIncorrect;

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = getTextTheme(context);
    final ColorScheme colorScheme = getColorScheme(context);

    return Column(
      children: List.generate(
        answers.length,
        (int index) {
          return GestureDetector(
            onTap: onTap,
            child: MainContainer(
              showBorder: true,
              borderColor: isSelectedCorrect
                  ? colorScheme.primaryFixed
                  : isSelectedIncorrect
                      ? colorScheme.error
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
}
