part of '../../home_screen.dart';

class _StreakWidget extends StatelessWidget {
  const _StreakWidget({
    required this.streak,
    required this.avatarPath,
  });

  final List<IStreak> streak;
  final String avatarPath;

  @override
  Widget build(BuildContext context) {
    return MainContainer(
      borderRadius: 10,
      padding: const EdgeInsetsDirectional.only(
        start: 10,
        top: 8,
        end: 10,
        bottom: 4,
      ),
      content: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          // TODO: avatar in streak
          // AvatarWidget(
          //   size: 30,
          //   avatarPath: avatarPath,
          // ),
          ..._buildStreak(context),
        ],
      ),
    );
  }

  List<Column> _buildStreak(BuildContext context) {
    final TextTheme textTheme = getTextTheme(context);

    final today = DateTime.now();
    final last7Days = List.generate(
      7,
      (index) {
        return today.subtract(Duration(days: index));
      },
    ).reversed;

    return last7Days.map(
      (day) {
        final IStreak streakForDay = streak.firstWhere(
          (streak) => _isSameDay(streak.date, day),
          orElse: () => Streak(status: StreakStatus.notLearned, date: day),
        );

        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SvgPicture.asset(
              height: 20,
              _getStreakImagePath(streakForDay.status),
            ),
            Text(
              DateFormat.E().format(day),
              style: textTheme.bodyMedium?.copyWith(
                fontSize: 14,
                fontWeight: streakForDay.status == StreakStatus.learned ||
                        streakForDay.status == StreakStatus.frozen
                    ? FontWeight.w700
                    : null,
              ),
            ),
          ],
        );
      },
    ).toList();
  }

  bool _isSameDay(DateTime date1, DateTime date2) {
    return date1.year == date2.year &&
        date1.month == date2.month &&
        date1.day == date2.day;
  }

  String _getStreakImagePath(StreakStatus status) {
    switch (status) {
      case StreakStatus.learned:
        return ImageAssets.activeStreak;
      case StreakStatus.frozen:
        return ImageAssets.frozenStreak;
      case StreakStatus.notLearned:
        return ImageAssets.notActiveStreak;
    }
  }
}
