part of '../../learn_screen.dart';

class _AlgorithmsContent extends StatelessWidget {
  const _AlgorithmsContent({
    required this.onCloseButtonTap,
    required this.onStartButtonTap,
    required this.categorySummary,
    required this.isLessonOpened,
  });

  final VoidCallback onCloseButtonTap;
  final void Function(int, int) onStartButtonTap;
  final ICategory categorySummary;
  final bool Function(int) isLessonOpened;

  @override
  Widget build(BuildContext context) {
    return MainScrollbar(
      child: ListView.builder(
        itemCount: categorySummary.topics.length,
        itemBuilder: (_, int index) {
          return _CategoryContainer(
            onStartTap: onStartButtonTap,
            isLessonOpened: isLessonOpened,
            onCloseIconTap: onCloseButtonTap,
            title: categorySummary.topics[index].title,
            lessonsSummary: categorySummary.topics[index].lessons,
            pattern: patterns[0],
          );
        },
      ),
    );
  }
}
