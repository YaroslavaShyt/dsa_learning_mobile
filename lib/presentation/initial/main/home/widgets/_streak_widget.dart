part of '../home_screen.dart';

class _StreakWidget extends StatelessWidget {
  const _StreakWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return MainContainer(
      borderRadius: 10,
      padding: const EdgeInsetsDirectional.only(
        start: 10,
        top: 8,
        end: 10,
        bottom: 4,
      ),
      content: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          const AvatarWidget(),
          ...List.generate(
            7,
            (int index) => Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                SvgPicture.asset(
                  ImageAssets.frozenStreak,
                ),
                Text('a'),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
