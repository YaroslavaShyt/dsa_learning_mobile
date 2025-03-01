part of '../../auth_screen.dart';

class _AuthSlider extends StatefulWidget {
  const _AuthSlider({
    required this.sliderComponents,
    required this.onPageChanged,
  });

  final List<Widget> sliderComponents;
  final void Function(int) onPageChanged;

  @override
  State<_AuthSlider> createState() => _AuthSliderState();
}

class _AuthSliderState extends State<_AuthSlider> {
  late final PageController _controller;
  late final Timer _timer;

  @override
  void initState() {
    super.initState();
    _controller = PageController();
    _timer = Timer.periodic(
      DurationConstants.fiveSecondsDuration,
      (_) => _onPageChanged(),
    );
  }

  void _onPageChanged() {
    final int index = _controller.page!.toInt();
    if (index == widget.sliderComponents.length - 1) {
      _controller.jumpToPage(0);
      widget.onPageChanged(0);
    } else {
      _controller.nextPage(
        duration: DurationConstants.twoSecondsDuration,
        curve: Curves.fastOutSlowIn,
      );
      widget.onPageChanged(index + 1);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsetsDirectional.symmetric(horizontal: 20),
      height: MediaQuery.sizeOf(context).height / 6,
      child: PageView.builder(
        controller: _controller,
        itemCount: widget.sliderComponents.length,
        physics: const NeverScrollableScrollPhysics(),
        itemBuilder: (_, int index) {
          return widget.sliderComponents[index];
        },
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    _timer.cancel();
    super.dispose();
  }
}
