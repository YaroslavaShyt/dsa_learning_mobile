part of '../auth_screen.dart';

class _StartContent extends StatelessWidget {
  const _StartContent({
    required this.selectedIndex,
    required this.onStartButtonPressed,
    required this.onSliderIndexChanged,
  });

  final VoidCallback onStartButtonPressed;
  final int selectedIndex;
  final void Function(int) onSliderIndexChanged;

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.sizeOf(context);
    final TextTheme textTheme = getTextTheme(context);
    final ColorScheme colorScheme = getColorScheme(context);

    return Column(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        RobotAnimation(
          height: size.height / 2.5,
          width: size.width / 1.5,
        ),
        MainContainer(
          margin: const EdgeInsetsDirectional.symmetric(horizontal: 20),
          height: 300,
          content: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              _SliderWithDots(
                selectedIndex: selectedIndex,
                onSliderIndexChanged: onSliderIndexChanged,
              ),
              Padding(
                padding: const EdgeInsetsDirectional.symmetric(horizontal: 80),
                child: MainOutlinedButton(
                  onPressed: onStartButtonPressed,
                  child: Text(
                    context.tr('start'),
                    style: textTheme.labelMedium?.copyWith(
                      color: colorScheme.primaryFixed,
                      fontWeight: FontWeight.w700,
                      fontSize: 20,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
