import 'package:dsa_learning/core/utils/theme/text_theme.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class AchievementsPopupContent extends StatelessWidget {
  const AchievementsPopupContent({super.key});

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = getTextTheme(context);
    return Column(
      children: [
        Row(
          children: [
            Text(
              context.tr("achievements"),
              style: textTheme.labelSmall?.copyWith(
                fontWeight: FontWeight.w700,
                fontSize: 24,
              ),
            ),
          ],
        )
      ],
    );
  }
}
