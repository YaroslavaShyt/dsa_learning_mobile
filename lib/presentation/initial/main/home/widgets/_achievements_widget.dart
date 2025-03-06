part of '../home_screen.dart';

class _AchievementsWidget extends StatelessWidget {
  const _AchievementsWidget({
    this.onSeeAllTap,
  });

  final VoidCallback? onSeeAllTap;

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
              GestureDetector(
                onTap: onSeeAllTap,
                child: Text(
                  context.tr("seeAll"),
                  style: getTextTheme(context).labelSmall?.copyWith(
                        fontSize: 12,
                      ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              ...List.generate(
                4,
                (int index) => SvgPicture.asset(
                  ImageAssets.lockedAchievement,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
