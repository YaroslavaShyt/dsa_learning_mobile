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
    return Positioned(
      left: 20,
      right: 20,
      bottom: 50,
      child: MainContainer(
        height: 300,
        content: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            _SliderWithDots(
              selectedIndex: selectedIndex,
              onSliderIndexChanged: onSliderIndexChanged,
            ),
            Padding(
              padding: const EdgeInsetsDirectional.symmetric(
                horizontal: 80.0,
              ),
              child: MainOutlinedButton(
                onPressed: onStartButtonPressed,
                child: Text(
                  context.tr('start'),
                  style: getTextTheme(context).labelMedium?.copyWith(
                        color: getColorScheme(context).primaryFixed,
                        fontWeight: FontWeight.w700,
                        fontSize: 20,
                      ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
