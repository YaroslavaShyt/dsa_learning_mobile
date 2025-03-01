part of '../../auth_screen.dart';

class _SliderWithDots extends StatelessWidget {
  const _SliderWithDots({
    required this.selectedIndex,
    required this.onSliderIndexChanged,
  });

  final void Function(int) onSliderIndexChanged;
  final int selectedIndex;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _AuthSlider(
          sliderComponents: _sliderTexts,
          onPageChanged: onSliderIndexChanged,
        ),
        _SliderIndicators(
          selectedIndex: selectedIndex,
        ),
      ],
    );
  }
}
