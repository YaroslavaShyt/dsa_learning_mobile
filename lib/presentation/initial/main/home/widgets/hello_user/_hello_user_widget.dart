part of '../../home_screen.dart';

class _HelloUserWidget extends StatefulWidget {
  const _HelloUserWidget({
    required this.userName,
    required this.bytes,
    required this.hash,
    required this.fan,
    required this.fansLastUpdated,
    required this.onManageCurrencyTap,
    required this.onTimerFinished,
    super.key,
  });

  final int fan;
  final int hash;
  final int bytes;
  final DateTime fansLastUpdated;
  final String userName;
  final VoidCallback onManageCurrencyTap;
  final VoidCallback onTimerFinished;

  @override
  _HelloUserWidgetState createState() => _HelloUserWidgetState();
}

class _HelloUserWidgetState extends State<_HelloUserWidget> {
  late Timer _timer;
  late Duration _timeRemaining;

  @override
  void initState() {
    super.initState();
    _calculateRemainingTime();
    if (widget.fan < 5) {
      _startTimer();
    }
  }

  void _startTimer() {
    _timer = Timer.periodic(
      const Duration(seconds: 1),
      (_) {
        setState(() {
          _calculateRemainingTime();
        });

        if (_timeRemaining <= Duration.zero) {
          widget.onTimerFinished();

          if (widget.fan < 5) {
            _startTimer();
          } else {
            _timer.cancel();
          }
        }
      },
    );
  }

  void _calculateRemainingTime() {
    if (widget.fan < 5) {
      final timeSinceLastUpdate =
          DateTime.now().difference(widget.fansLastUpdated);
      final maxTime = const Duration(hours: 4, minutes: 30);
      final remainingTime = maxTime - timeSinceLastUpdate;

      if (remainingTime > Duration.zero) {
        _timeRemaining = remainingTime;
      } else {
        _timeRemaining = Duration.zero;
      }
    } else {
      _timeRemaining = Duration.zero;
    }
  }

  String _formatTime(Duration duration) {
    final hours = duration.inHours;
    final minutes = duration.inMinutes % 60;
    final seconds = duration.inSeconds % 60;
    return '${hours.toString().padLeft(2, '0')}:${minutes.toString().padLeft(2, '0')}:${seconds.toString().padLeft(2, '0')}';
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;
    return MainContainer(
      height: 270,
      padding: const EdgeInsetsDirectional.symmetric(
        horizontal: 20,
        vertical: 16,
      ),
      content: Stack(
        children: [
          Positioned(
            top: 0,
            left: 0,
            child: Text(
              "${context.tr("helloUser")}\n${widget.userName}",
              maxLines: 2,
              style: textTheme.titleLarge?.copyWith(
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          Positioned(
            left: 0,
            bottom: 0,
            child: SizedBox(
              height: 155,
              width: 190,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  _CurrencyItem(
                    text: "bytes",
                    icon: ImageAssets.bytes,
                    value: widget.bytes,
                  ),
                  _CurrencyItem(
                    text: "vents",
                    icon: ImageAssets.vents,
                    value: widget.fan,
                  ),
                  _CurrencyItem(
                    text: "hash",
                    icon: ImageAssets.hash,
                    shouldShowDivider: false,
                    value: widget.hash,
                  ),
                ],
              ),
            ),
          ),
          const Positioned(
            right: -30,
            top: 10,
            bottom: 10,
            child: MainAnimationWidget(
              height: 200,
              width: 200,
              name: LottieAssets.welcomeRobot,
            ),
          ),
          Positioned(
            top: 0,
            right: 0,
            child: TapAnimatedWidget(
              onTap: widget.onManageCurrencyTap,
              child: SizedBox(
                height: 50,
                child: Text(
                  context.tr("manageCurrency"),
                  style: textTheme.labelSmall?.copyWith(
                    fontSize: 14,
                  ),
                ),
              ),
            ),
          ),
          if (widget.fan < 5)
            Positioned(
              bottom: 10,
              child: Padding(
                padding: const EdgeInsetsDirectional.only(top: 10),
                child: Text(
                  '${context.tr('nextVentIn')}: ${_formatTime(_timeRemaining)}',
                  style: textTheme.bodyMedium?.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            )
        ],
      ),
    );
  }
}
