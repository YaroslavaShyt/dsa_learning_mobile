part of '../learn_screen.dart';

class _LearnTabBar extends StatelessWidget {
  const _LearnTabBar({
    required this.onCloseButtonTap,
    required this.onStartButtonTap,
    required this.lessonsSummary,
    required this.isLessonOpened,
  });

  final VoidCallback onCloseButtonTap;
  final void Function(int, int, String) onStartButtonTap;
  final List<ICategory> lessonsSummary;
  final bool Function(int) isLessonOpened;

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = getTextTheme(context);
    return MainTabBar(
      labelStyle: textTheme.labelSmall?.copyWith(
        fontWeight: FontWeight.w700,
        fontSize: 16,
        fontFamily: 'nunito',
      ),
      tabs: [
        Tab(
          child: Text(
            context.tr('algorithms'),
          ),
        ),
        Tab(
          child: Text(
            context.tr('dataStructures'),
          ),
        ),
      ],
      tabBarContent: [
        _AlgorithmsContent(
          isLessonOpened: isLessonOpened,
          categorySummary: lessonsSummary.last,
          onCloseButtonTap: onCloseButtonTap,
          onStartButtonTap: (id, val) =>
              onStartButtonTap(id, val, 'ALGORITHMS'),
        ),
        _DataStructuresContent(
          isLessonOpened: isLessonOpened,
          categorySummary: lessonsSummary.first,
          onCloseButtonTap: onCloseButtonTap,
          onStartButtonTap: (id, val) =>
              onStartButtonTap(id, val, 'DATA_STRUCTURES'),
        ),
      ],
    );
  }
}
