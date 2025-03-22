part of '../learn_screen.dart';

class _CategoryContainer extends StatelessWidget with BottomSheetMixin {
  const _CategoryContainer({
    required this.title,
    required this.pattern,
    required this.lessonsSummary,
    required this.onStartTap,
    required this.onCloseIconTap,
  });

  final String title;
  final Pattern pattern;
  final List<ILesson> lessonsSummary;
  final VoidCallback onCloseIconTap;
  final void Function(int) onStartTap;

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = getTextTheme(context);
    return MainContainer(
      height: 240,
      width: double.infinity,
      padding: const EdgeInsetsDirectional.all(20),
      margin: const EdgeInsetsDirectional.only(start: 4, end: 4, bottom: 20),
      content: Stack(
        children: [
          Positioned(
            child: SizedBox(
              width: 100,
              child: Text(
                title,
                style: textTheme.labelSmall?.copyWith(
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ),
          ...List.generate(
            lessonsSummary.length - 1,
            (int index) {
              return MainDottedLine(
                position: pattern.dashPositions[index],
              );
            },
          ),
          ...List.generate(
            lessonsSummary.length,
            (int index) {
              return _LevelWidget(
                levelNum: (index + 1).toString(),
                position: pattern.positions[index],
                onTap: () => showAppBottomSheet(
                  context: context,
                  child: PreLessonInfo(
                    categoryName: title,
                    lesson: lessonsSummary[index],
                    onCloseIconTap: onCloseIconTap,
                    onStartTap: () => onStartTap(lessonsSummary[index].id),
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
