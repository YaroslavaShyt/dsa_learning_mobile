import 'package:dsa_learning/core/constants/image_assets.dart';
import 'package:dsa_learning/core/utils/theme/app_color_theme.dart';
import 'package:dsa_learning/core/utils/theme/text_theme.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class ProgressBarComponent extends StatefulWidget {
  const ProgressBarComponent({
    required this.vents,
    required this.time,
    super.key,
  });

  final int vents;
  final int time;

  @override
  State<ProgressBarComponent> createState() => _ProgressBarComponentState();
}

class _ProgressBarComponentState extends State<ProgressBarComponent>
    with TickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<Offset> _animation;

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );

    _animation = Tween<Offset>(
      begin: const Offset(0, -0.1),
      end: const Offset(0, 0),
    ).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Curves.easeOut,
      ),
    );
  }

  @override
  void didUpdateWidget(covariant ProgressBarComponent oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (widget.vents != oldWidget.vents) {
      _animationController.forward(from: 0);
    }
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final ColorScheme colorScheme = getColorScheme(context);
    final TextTheme textTheme = getTextTheme(context);

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          height: 40,
          padding: const EdgeInsetsDirectional.symmetric(
            horizontal: 6,
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            color: colorScheme.onSecondaryContainer,
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsetsDirectional.only(
                  start: 4,
                  bottom: 4,
                ),
                child: Text(
                  '${widget.vents.toString()}x',
                  style: textTheme.labelMedium?.copyWith(
                    fontWeight: FontWeight.w700,
                    color: colorScheme.primaryFixed,
                    fontSize: 18,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsetsDirectional.only(top: 8.0),
                child: SlideTransition(
                  position: _animation,
                  child: Image.asset(
                    height: 40,
                    width: 40,
                    ImageAssets.vents,
                  ),
                ),
              ),
            ],
          ),
        ),
        Column(
          children: [
            Container(
              padding: const EdgeInsetsDirectional.symmetric(
                horizontal: 12,
                vertical: 8,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: widget.time == 0
                    ? colorScheme.onSurface.withValues(alpha: 0.3)
                    : colorScheme.error,
              ),
              child: Text(
                _formatTime(widget.time),
                style: textTheme.labelMedium?.copyWith(
                  fontWeight: FontWeight.w700,
                  fontSize: 18,
                ),
              ),
            ),
            if (widget.time > 0)
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsetsDirectional.only(bottom: 8.0),
                    child: Text(
                      '+10',
                      style: textTheme.labelMedium?.copyWith(
                        fontWeight: FontWeight.w700,
                        color: colorScheme.primaryFixed,
                        fontSize: 12,
                      ),
                    ),
                  ),
                  Image.asset(
                    height: 30,
                    width: 30,
                    ImageAssets.bytes,
                  ),
                ],
              ),
          ],
        ),
      ],
    );
  }

  String _formatTime(int seconds) {
    return DateFormat('mm:ss').format(
      DateTime(0).add(
        Duration(seconds: seconds),
      ),
    );
  }
}
