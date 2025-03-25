import 'package:dsa_learning/core/utils/theme/app_color_theme.dart';
import 'package:dsa_learning/core/utils/theme/text_theme.dart';
import 'package:dsa_learning/presentation/widgets/main_container.dart';
import 'package:flutter/material.dart';

class LessonFinishedContainer extends StatelessWidget {
  const LessonFinishedContainer({
    required this.time,
    required this.lessonName,
    required this.lessonDescription,
    required this.isGame,
    super.key,
  });

  final String time;
  final String lessonName;
  final String lessonDescription;
  final bool isGame;

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = getTextTheme(context);
    final ColorScheme colorScheme = getColorScheme(context);

    return MainContainer(
      padding: const EdgeInsetsDirectional.symmetric(
        horizontal: 20,
        vertical: 20,
      ),
      content: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                lessonName,
                style: textTheme.bodyMedium?.copyWith(
                  fontSize: 16,
                ),
              ),
              if (lessonDescription.isNotEmpty)
                Text(
                  lessonDescription,
                  style: textTheme.bodyMedium?.copyWith(
                    fontSize: 14,
                  ),
                ),
            ],
          ),
          Container(
            padding: const EdgeInsetsDirectional.symmetric(
              horizontal: 10,
              vertical: 4,
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              border: Border.all(
                width: 4,
                color: colorScheme.primaryFixed,
              ),
            ),
            child: Text(
              time,
              style: textTheme.bodyMedium?.copyWith(
                fontSize: 18,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
