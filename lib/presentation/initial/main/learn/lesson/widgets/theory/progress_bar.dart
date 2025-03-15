import 'package:dsa_learning/core/utils/theme/app_color_theme.dart';
import 'package:dsa_learning/core/utils/theme/text_theme.dart';
import 'package:dsa_learning/presentation/widgets/main_container.dart';
import 'package:flutter/material.dart';

class ProgressBar extends StatelessWidget {
  const ProgressBar({
    required this.lessonName,
    super.key,
  });

  final String lessonName;

  @override
  Widget build(BuildContext context) {
    final ColorScheme colorScheme = getColorScheme(context);
    final TextTheme textTheme = getTextTheme(context);

    return MainContainer(
      borderRadius: 14,
      color: colorScheme.onSurface.withValues(alpha: 0.4),
      padding: const EdgeInsetsDirectional.symmetric(
        horizontal: 20,
        vertical: 20,
      ),
      content: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Row(
            children: [
              Text(
                lessonName,
                style: textTheme.labelMedium,
              ),
            ],
          ),
          const SizedBox(height: 10),
          Container(
            width: double.infinity,
            height: 16,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(4),
              color: colorScheme.surface,
            ),
          )
        ],
      ),
    );
  }
}
