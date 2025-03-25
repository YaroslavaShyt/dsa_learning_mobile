import 'package:dsa_learning/core/utils/theme/app_color_theme.dart';
import 'package:dsa_learning/core/utils/theme/text_theme.dart';
import 'package:dsa_learning/data/achievements/achievement.dart';
import 'package:dsa_learning/presentation/widgets/main_container.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class AchievementsRow extends StatelessWidget {
  const AchievementsRow({
    required this.achievements,
    super.key,
  });

  final List<AchievementType> achievements;

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = getTextTheme(context);
    final ColorScheme colorScheme = getColorScheme(context);

    if (achievements.isEmpty) {
      return const SizedBox.shrink();
    }
    return Column(
      spacing: 10,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          context.tr('achievements'),
          style: textTheme.titleLarge?.copyWith(
            color: colorScheme.onSurface,
            fontSize: 18,
            fontWeight: FontWeight.w700,
          ),
        ),
        SizedBox(
          height: 100,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: achievements.length,
            itemBuilder: (BuildContext context, int index) {
              final AchievementType achievement = achievements[index];
              return MainContainer(
                margin: const EdgeInsetsDirectional.only(end: 10),
                padding: const EdgeInsetsDirectional.all(10),
                content: Row(
                  children: [
                    Image.asset(
                      height: 70,
                      width: 70,
                      achievement.image,
                    ),
                    SizedBox(
                      width: 180,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            context.tr(achievement.apiString),
                            style: textTheme.titleLarge?.copyWith(
                              color: colorScheme.onSurface,
                              fontSize: 14,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          Text(
                            context.tr('${achievement.apiString}Description'),
                            style: textTheme.titleLarge?.copyWith(
                              color: colorScheme.onSurface,
                              fontSize: 14,
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
