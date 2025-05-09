part of '../../learn_screen.dart';

class _AlgorithmsContent extends StatelessWidget {
  const _AlgorithmsContent({
    required this.playSound,
    required this.onCloseButtonTap,
    required this.onStartButtonTap,
    required this.categorySummary,
    required this.isLessonOpened,
    required this.vents,
  });

  final VoidCallback playSound;
  final VoidCallback onCloseButtonTap;
  final void Function(int, int) onStartButtonTap;
  final ICategory categorySummary;
  final bool Function(int) isLessonOpened;
  final int vents;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: categorySummary.topics.length,
      itemBuilder: (_, int index) {
        return Padding(
          padding: EdgeInsets.only(
            bottom: index == categorySummary.topics.length - 1 ? 120 : 0,
          ),
          child: _CategoryContainer(
            key: index == 0 ? lessonCategoryKey : null,
            playSound: playSound,
            vents: vents,
            onStartTap: onStartButtonTap,
            isLessonOpened: isLessonOpened,
            onCloseIconTap: onCloseButtonTap,
            title: categorySummary.topics[index].title,
            lessonsSummary: categorySummary.topics[index].lessons,
            pattern: patterns[0],
          ),
        );
      },
    );
  }
}
