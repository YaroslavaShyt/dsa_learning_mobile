import 'dart:async';

import 'package:dsa_learning/core/constants/image_assets.dart';
import 'package:dsa_learning/core/utils/theme/app_color_theme.dart';
import 'package:dsa_learning/core/utils/theme/text_theme.dart';
import 'package:dsa_learning/presentation/widgets/main_container.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import 'check_box/check_box.dart';

class GameProgressBar extends StatefulWidget {
  const GameProgressBar({
    required this.time,
    required this.updateTimer,
    required this.value,
    required this.gameName,
    required this.questionsNum,
    required this.gameProgress,
    super.key,
  });

  final VoidCallback updateTimer;
  final int time;
  final String gameName;
  final double value;
  final int questionsNum;
  final List<bool> gameProgress;

  @override
  State<GameProgressBar> createState() => _GameProgressBarState();
}

class _GameProgressBarState extends State<GameProgressBar>
    with TickerProviderStateMixin {
  late AnimationController _controller;
  late final Timer? _timer;

  @override
  void initState() {
    super.initState();
    _startTimer();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 500),
      vsync: this,
    );

    _controller.forward();
  }

  void _startTimer() {
    _timer = Timer.periodic(
      const Duration(seconds: 1),
      (timer) {
        widget.updateTimer();
      },
    );
  }

  void _stopTimer() {
    if (_timer != null) {
      _timer.cancel();
    }
  }

  String _formatTime(int seconds) {
    return DateFormat('mm:ss').format(
      DateTime(0).add(
        Duration(seconds: seconds),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    _stopTimer();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final ColorScheme colorScheme = getColorScheme(context);
    final TextTheme textTheme = getTextTheme(context);

    return MainContainer(
      borderRadius: 14,
      color: colorScheme.onSurface.withValues(alpha: 0.4),
      padding: const EdgeInsetsDirectional.symmetric(
        horizontal: 20,
        vertical: 20,
      ),
      content: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Flexible(
            flex: 2,
            child: Column(
              spacing: 10,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  widget.gameName,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: textTheme.labelMedium,
                ),
                Row(
                  spacing: 10,
                  children: List.generate(
                    widget.questionsNum,
                    (int index) {
                      final isChecked = widget.gameProgress.length > index;
                      final isCorrect =
                          isChecked ? widget.gameProgress[index] : true;
                      return MainCheckbox(
                        size: 26,
                        isChecked: isChecked,
                        isCorrect: isCorrect,
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
          Flexible(
            child: Column(
              children: [
                Container(
                  padding: const EdgeInsetsDirectional.symmetric(
                    horizontal: 10,
                    vertical: 6,
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
                      )
                    ],
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
