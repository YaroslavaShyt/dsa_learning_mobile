part of '../learn_screen.dart';

class _LearnTabBar extends StatelessWidget {
  const _LearnTabBar({
    required this.playSound,
    required this.onCloseButtonTap,
    required this.onStartButtonTap,
    required this.lessonsSummary,
    required this.isLessonOpened,
    required this.isPreviousTopicFinished,
    required this.vents,
  });

  final VoidCallback playSound;
  final VoidCallback onCloseButtonTap;
  final void Function(int, int, String) onStartButtonTap;
  final bool Function(int, int) isPreviousTopicFinished;
  final List<ICategory> lessonsSummary;
  final bool Function(int) isLessonOpened;
  final int vents;

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
          vents: vents,
          playSound: playSound,
          isLessonOpened: isLessonOpened,
          categorySummary: lessonsSummary.last,
          isPreviousTopicFinished: isPreviousTopicFinished,
          onCloseButtonTap: onCloseButtonTap,
          onStartButtonTap: (id, val) =>
              onStartButtonTap(id, val, 'ALGORITHMS'),
        ),
        _DataStructuresContent(
          vents: vents,
          playSound: playSound,
          isLessonOpened: isLessonOpened,
          isPreviousTopicFinished: isPreviousTopicFinished,
          categorySummary: lessonsSummary.first,
          onCloseButtonTap: onCloseButtonTap,
          onStartButtonTap: (id, val) =>
              onStartButtonTap(id, val, 'DATA_STRUCTURES'),
        ),
      ],
    );
  }
}
