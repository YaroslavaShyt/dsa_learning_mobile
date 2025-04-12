import 'package:auto_size_text_plus/auto_size_text_plus.dart';
import 'package:dsa_learning/core/utils/theme/text_theme.dart';
import 'package:dsa_learning/presentation/widgets/main_container.dart';
import 'package:flutter/material.dart';

class TitleContainer extends StatelessWidget {
  const TitleContainer({
    this.categoryName = 'Алгоритми сортування',
    this.lessonName = 'Урок 1: Вступ',
    super.key,
  });

  final String categoryName;
  final String lessonName;

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = getTextTheme(context);
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
              child: AutoSizeText(
                categoryName,
                maxFontSize: 20,
                minFontSize: 10,
                style: textTheme.labelMedium?.copyWith(
                  fontWeight: FontWeight.w700,
                ),
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
