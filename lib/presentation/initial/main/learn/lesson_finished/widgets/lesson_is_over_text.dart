import 'package:dsa_learning/core/utils/theme/app_color_theme.dart';
import 'package:dsa_learning/core/utils/theme/text_theme.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class LessonIsOverText extends StatelessWidget {
  const LessonIsOverText({
    required this.isSuccess,
    super.key,
  });

  final bool isSuccess;

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = getTextTheme(context);
    final ColorScheme colorScheme = getColorScheme(context);
    if (isSuccess) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            context.tr('lessonIsOver'),
            style: textTheme.titleLarge?.copyWith(
              color: colorScheme.onSurface,
              fontSize: 30,
              fontWeight: FontWeight.w700,
            ),
          ),
        ],
      );
    }
    return Column(
      children: [
        Text(
          context.tr('lessonIsNotOver'),
          style: textTheme.titleLarge?.copyWith(
            color: colorScheme.onSurface,
            fontSize: 30,
            fontWeight: FontWeight.w700,
          ),
        ),
        Text(
          context.tr('dontLoseMotivation'),
          textAlign: TextAlign.center,
          style: textTheme.titleLarge?.copyWith(
            color: colorScheme.onSurface,
            fontSize: 16,
            fontWeight: FontWeight.w700,
          ),
        ),
      ],
    );
  }
}
