import 'package:dsa_learning/core/utils/theme/text_theme.dart';
import 'package:flutter/material.dart';

class StepName extends StatelessWidget {
  const StepName({
    required this.stepName,
    super.key,
  });

  final String stepName;

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = getTextTheme(context);

    return Text(
      stepName,
      textAlign: TextAlign.center,
      style: textTheme.labelMedium?.copyWith(
        fontWeight: FontWeight.w700,
      ),
    );
  }
}
