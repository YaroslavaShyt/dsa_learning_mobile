part of '../../learn_screen.dart';

class _DataStructuresContent extends StatelessWidget with BottomSheetMixin {
  const _DataStructuresContent({
    required this.onCloseButtonTap,
    required this.onStartButtonTap,
    required this.categorySummary,
    required this.isLessonOpened,
    required this.playSound,
    required this.vents,
    super.key,
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
        return _CategoryContainer(
          vents: vents,
          playSound: playSound,
          onStartTap: onStartButtonTap,
          isLessonOpened: isLessonOpened,
          onCloseIconTap: onCloseButtonTap,
          title: categorySummary.topics[index].title,
          lessonsSummary: categorySummary.topics[index].lessons,
          pattern: patterns[0],
        );
      },
    );
  }
}
