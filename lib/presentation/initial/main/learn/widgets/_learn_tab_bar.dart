part of '../learn_screen.dart';

class _LearnTabBar extends StatelessWidget {
  const _LearnTabBar({
    required this.onCloseButtonTap,
    required this.onStartButtonTap,
    required this.lessonsSummary,
  });

  final VoidCallback onCloseButtonTap;
  final VoidCallback onStartButtonTap;
  final List<ICategory> lessonsSummary;

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = getTextTheme(context);
    return MainTabBar(
      labelStyle: textTheme.labelSmall?.copyWith(fontWeight: FontWeight.w700),
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
          categorySummary: lessonsSummary.first,
          onCloseButtonTap: onCloseButtonTap,
          onStartButtonTap: onStartButtonTap,
        ),
        //_DataStructuresContent(),
        Container(),
      ],
    );
  }
}
