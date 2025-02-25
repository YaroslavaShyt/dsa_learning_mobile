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
    if (_controller.page?.toInt() != widget.sliderComponents.length - 1) {
      _controller.nextPage(
        duration: DurationConstants.twoSecondsDuration,
        curve: Curves.fastOutSlowIn,
      );
    } else {
      _controller.jumpToPage(0);
    }
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.sizeOf(context).height / 6,
      child: PageView.builder(
        controller: _controller,
        physics: NeverScrollableScrollPhysics(),
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
