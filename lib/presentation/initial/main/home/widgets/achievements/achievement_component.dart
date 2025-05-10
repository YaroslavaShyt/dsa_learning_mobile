import 'package:dsa_learning/core/utils/theme/text_theme.dart';
import 'package:dsa_learning/domain/rewards/achievements/iachievement.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class AchievementComponent extends StatelessWidget {
  const AchievementComponent({
    required this.achievement,
    super.key,
  });

  final IAchievement achievement;

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = getTextTheme(context);

    return Flexible(
      child: Container(
        width: 50,
        margin: const EdgeInsetsDirectional.symmetric(
          horizontal: 20,
          vertical: 4,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
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
                _image,
                if (achievement.isLocked) const SizedBox(width: 10),
                _buildDateAndDescription(context, textTheme),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget get _image {
    return achievement.isLocked
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
  }

  Widget _buildDateAndDescription(BuildContext context, TextTheme textTheme) {
    return Flexible(
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
              context.tr('${achievement.achievementType.apiString}Description'),
              style: textTheme.labelSmall?.copyWith(fontSize: 14),
              maxLines: 4,
            ),
          ),
        ],
      ),
    );
  }
}
