import 'package:dsa_learning/core/utils/theme/text_theme.dart';
import 'package:flutter/material.dart';

class GameQuestion extends StatelessWidget {
  const GameQuestion({
    required this.step,
    required this.question,
    super.key,
  });

  final int step;
  final String question;

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = getTextTheme(context);

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Flexible(
          child: Text(
            step.toString(),
            style: textTheme.bodyMedium?.copyWith(
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
        Flexible(
          flex: 2,
          child: Text(
            question,
            textAlign: TextAlign.center,
            style: textTheme.bodyMedium?.copyWith(
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
        const SizedBox.shrink(),
      ],
    );
  }
}
