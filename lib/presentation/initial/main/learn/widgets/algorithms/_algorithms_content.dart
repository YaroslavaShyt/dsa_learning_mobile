part of '../../learn_screen.dart';

class _AlgorithmsContent extends StatelessWidget with BottomSheetMixin {
  const _AlgorithmsContent({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 4,
      itemBuilder: (_, int index) {
        return _CategoryContainer(
          pattern: patterns[0],
          onLevelTap: () => showAppBottomSheet(
            context: context,
            child: PreLessonInfo(
              onCloseIconTap: () {},
            ),
          ),
        );
      },
    );
  }
}
