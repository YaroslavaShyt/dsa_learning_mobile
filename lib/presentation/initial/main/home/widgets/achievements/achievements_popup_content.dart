import 'package:dsa_learning/core/utils/theme/app_color_theme.dart';
import 'package:dsa_learning/core/utils/theme/text_theme.dart';
import 'package:dsa_learning/domain/rewards/achievements/iachievement.dart';
import 'package:dsa_learning/presentation/initial/main/home/widgets/achievements/achievement_component.dart';
import 'package:dsa_learning/presentation/widgets/main_shadow.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class AchievementsPopupContent extends StatelessWidget {
  const AchievementsPopupContent({
    required this.achievements,
    required this.onCloseButtonTap,
    super.key,
  });

  final List<IAchievement> achievements;
  final VoidCallback onCloseButtonTap;

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = getTextTheme(context);
    final ColorScheme colorScheme = getColorScheme(context);

    return Column(
      children: [
        const SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const SizedBox(width: 30),
            Row(
              spacing: 10,
              children: [
                Text(
                  context.tr("achievements"),
                  style: textTheme.labelSmall?.copyWith(
                    fontWeight: FontWeight.w700,
                    fontSize: 20,
                  ),
                ),
                Text(
                  '$_unlockedAchievements/${achievements.length}',
                  style: textTheme.labelSmall?.copyWith(
                    fontWeight: FontWeight.w700,
                    fontSize: 20,
                    color: colorScheme.onSurface.withValues(alpha: 0.4),
                  ),
                ),
              ],
            ),
            IconButton(
              icon: Icon(
                Icons.close_rounded,
                color: colorScheme.onSurface,
                shadows: [mainBoxShadow(context)],
              ),
              onPressed: onCloseButtonTap,
            ),
          ],
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsetsDirectional.only(
              end: 8,
              bottom: 8,
            ),
            child: Scrollbar(
              thumbVisibility: true,
              thickness: 6,
              radius: const Radius.circular(20),
              child: ListView.builder(
                itemCount: achievements.length,
                itemBuilder: (context, index) {
                  return AchievementComponent(
                    achievement: achievements[index],
                  );
                },
              ),
            ),
          ),
        ),
      ],
    );
  }

  int get _unlockedAchievements =>
      achievements.where((achievement) => !achievement.isLocked).length;
}
