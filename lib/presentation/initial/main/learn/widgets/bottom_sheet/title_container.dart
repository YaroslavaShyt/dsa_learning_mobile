import 'package:auto_size_text_plus/auto_size_text_plus.dart';
import 'package:dsa_learning/core/utils/theme/app_color_theme.dart';
import 'package:dsa_learning/core/utils/theme/text_theme.dart';
import 'package:dsa_learning/presentation/widgets/main_container.dart';
import 'package:flutter/material.dart';

class TitleContainer extends StatelessWidget {
  const TitleContainer({
    required this.categoryName,
    required this.lessonName,
    required this.isLearned,
    super.key,
  });

  final bool isLearned;
  final String categoryName;
  final String lessonName;

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = getTextTheme(context);
    final ColorScheme colorScheme = getColorScheme(context);

    return Positioned(
      left: 10,
      right: 10,
      top: 40,
      child: MainContainer(
        width: 350,
        height: 100,
        padding: const EdgeInsetsDirectional.symmetric(
          horizontal: 20,
          vertical: 16,
        ),
        content: Column(
          spacing: 10,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Flexible(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Flexible(
                    child: AutoSizeText(
                      categoryName,
                      maxFontSize: 20,
                      minFontSize: 10,
                      style: textTheme.labelMedium?.copyWith(
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                  if (isLearned)
                    Container(
                      padding: const EdgeInsetsDirectional.all(4),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: colorScheme.primaryFixed,
                      ),
                      child: Icon(
                        Icons.check,
                        color: colorScheme.surface,
                        weight: 2,
                      ),
                    ),
                ],
              ),
            ),
            Flexible(
              child: AutoSizeText(
                lessonName,
                maxFontSize: 20,
                minFontSize: 10,
                style: textTheme.labelMedium?.copyWith(
                  fontSize: 16,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
