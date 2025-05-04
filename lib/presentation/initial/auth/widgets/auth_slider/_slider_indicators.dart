part of '../../auth_screen.dart';

class _SliderIndicators extends StatelessWidget {
  const _SliderIndicators({
    required this.selectedIndex,
  });

  final int selectedIndex;

  @override
  Widget build(BuildContext context) {
    final ColorScheme colorScheme = getColorScheme(context);

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
        _sliderTexts.length,
        (int index) => Container(
          margin: const EdgeInsetsDirectional.all(10),
          height: 10,
          width: 10,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: index == selectedIndex
                ? colorScheme.onSurface
                : colorScheme.shadow,
          ),
        ),
      ),
    );
  }
}
