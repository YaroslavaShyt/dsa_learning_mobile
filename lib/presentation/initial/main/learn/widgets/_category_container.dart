part of '../learn_screen.dart';

class _CategoryContainer extends StatelessWidget
    with BottomSheetMixin, PopUpMixin {
  const _CategoryContainer({
    required this.title,
    required this.pattern,
    required this.lessonsSummary,
    required this.onStartTap,
    required this.onCloseIconTap,
    required this.isLessonOpened,
  });

  final String title;
  final Pattern pattern;
  final List<ILesson> lessonsSummary;
  final VoidCallback onCloseIconTap;
  final bool Function(int) isLessonOpened;
  final void Function(int, int) onStartTap;

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = getTextTheme(context);

    return MainContainer(
      height: 220,
      width: double.infinity,
      padding: const EdgeInsetsDirectional.all(20),
      margin: const EdgeInsetsDirectional.only(
        start: 4,
        end: 4,
        bottom: 20,
      ),
      content: Stack(
        children: [
          Positioned(
            child: SizedBox(
              width: MediaQuery.sizeOf(context).width / 2,
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
                isOpened: _isOpened(index),
                levelNum: (index + 1).toString(),
                position: pattern.positions[index],
                onTap: () => BlocProvider.of<LearnCubit>(context).vents > 0
                    ? showAppBottomSheet(
                        context: context,
                        child: PreLessonInfo(
                          categoryName: title,
                          lesson: lessonsSummary[index],
                          onCloseIconTap: onCloseIconTap,
                          onStartTap: () => onStartTap(
                            lessonsSummary[index].id,
                            lessonsSummary[index].gameId,
                          ),
                        ),
                      )
                    : _onAllVentsUsed(context),
              );
            },
          ),
        ],
      ),
    );
  }

  void _onAllVentsUsed(BuildContext context) {
    showPopup(
      context: context,
      child: AllVentsUsedPopupContent(
        onConfirmTap: () {
          Navigator.of(context).pop();
          _showShop(context);
        },
        onCancelTap: Navigator.of(context).pop,
      ),
    );
  }

  void _showShop(BuildContext context) {
    showPopup(
      height: 450,
      context: context,
      child: ShopFactory.build(),
    );
  }

  bool _isOpened(int index) {
    if (index > 0) return isLessonOpened(lessonsSummary[index - 1].id);

    return isLessonOpened(lessonsSummary[index].id);
  }
}
