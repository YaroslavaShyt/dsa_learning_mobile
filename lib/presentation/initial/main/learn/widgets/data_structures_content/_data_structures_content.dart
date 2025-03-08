part of '../../learn_screen.dart';

class _DataStructuresContent extends StatelessWidget with BottomSheetMixin {
  const _DataStructuresContent({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 4,
      itemBuilder: (_, int index) {
        return _CategoryContainer(
          pattern: patterns[1],
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
