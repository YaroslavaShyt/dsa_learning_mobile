import 'package:dsa_learning/core/utils/theme/app_color_theme.dart';
import 'package:dsa_learning/core/utils/theme/text_theme.dart';
import 'package:dsa_learning/domain/achievements/iachievement.dart';
import 'package:dsa_learning/presentation/initial/main/learn/widgets/bottom_sheet/close_button.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AchievementsPopupContent extends StatelessWidget {
  const AchievementsPopupContent({
    required this.achievements,
    super.key,
  });

  final List<IAchievement> achievements;

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = getTextTheme(context);
    return Column(
      children: [
        const SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              context.tr("achievements"),
              style: textTheme.labelSmall?.copyWith(
                fontWeight: FontWeight.w700,
                fontSize: 20,
              ),
            ),
            const SizedBox(width: 10),
            Text(
              '2/9',
              style: textTheme.labelSmall?.copyWith(
                fontWeight: FontWeight.w700,
                fontSize: 20,
                color: getColorScheme(context).onSurface.withValues(alpha: 0.4),
              ),
            ),
            AppCloseButton(onCloseButtonTap: () {}),
          ],
        ),
        Expanded(
          child: ListView.builder(
            itemCount: achievements.length,
            itemBuilder: (context, index) {
              return _buildAchievement(context, achievements[index]);
            },
          ),
        ),
      ],
    );
  }

  Widget _buildAchievement(BuildContext context, IAchievement achievement) {
    final image = achievement.isLocked
        ? SvgPicture.asset(
            achievement.path,
            height: 40,
            width: 40,
          )
        : Image.asset(
            achievement.path,
            height: 50,
            width: 50,
          );
    final TextTheme textTheme = getTextTheme(context);
    return Container(
      width: 50,
      height: 90,
      margin: const EdgeInsetsDirectional.symmetric(
        horizontal: 20,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Flexible(
            child: Text(
              context.tr(achievement.achievementType.apiString),
              style: textTheme.labelSmall?.copyWith(
                fontWeight: FontWeight.w700,
                fontSize: 16,
              ),
              maxLines: 1,
            ),
          ),
          if (achievement.isLocked) const SizedBox(height: 5),
          Row(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              image,
              if (achievement.isLocked) const SizedBox(width: 10),
              Flexible(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const SizedBox(height: 5),
                    if (!achievement.isLocked) ...[
                      Flexible(
                        child: Text(
                          DateFormat('dd/MM/yyyy')
                              .format(achievement.achievedOn)
                              .toString(),
                          style: textTheme.labelSmall?.copyWith(
                            fontSize: 12,
                            fontWeight: FontWeight.w700,
                          ),
                          maxLines: 1,
                        ),
                      ),
                    ],
                    Flexible(
                      child: Text(
                        context.tr(
                            '${achievement.achievementType.apiString}Description'),
                        style: textTheme.labelSmall?.copyWith(fontSize: 14),
                        maxLines: 4,
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
