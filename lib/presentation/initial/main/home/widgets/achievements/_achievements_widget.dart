part of '../../home_screen.dart';

class _AchievementsWidget extends StatelessWidget {
  const _AchievementsWidget({
    required this.achievements,
    required this.onSeeAllTap,
  });

  final VoidCallback onSeeAllTap;
  final List<IAchievement> achievements;

  @override
  Widget build(BuildContext context) {
    return MainContainer(
      padding: const EdgeInsetsDirectional.symmetric(
        horizontal: 16,
        vertical: 12,
      ),
      content: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                context.tr("achievements"),
                style: getTextTheme(context).labelSmall?.copyWith(
                      fontWeight: FontWeight.w700,
                    ),
              ),
              TapAnimatedWidget(
                onTap: onSeeAllTap,
                child: SizedBox(
                  height: 20,
                  width: 100,
                  child: Text(
                    context.tr("seeAll"),
                    style: getTextTheme(context).labelSmall?.copyWith(
                          fontSize: 12,
                        ),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              if (achievements.length > 4)
                ...List.generate(
                  4,
                  (int index) {
                    if (achievements[index].isLocked) {
                      return SvgPicture.asset(
                        achievements[index].path,
                        height: 60,
                        width: 60,
                      );
                    }
                    return Image.asset(
                      achievements[index].path,
                      height: 70,
                      width: 70,
                    );
                  },
                ),
            ],
          ),
        ],
      ),
    );
  }
}
