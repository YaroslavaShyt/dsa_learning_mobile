import 'dart:async';

import 'package:dsa_learning/core/utils/theme/app_color_theme.dart';
import 'package:dsa_learning/core/utils/theme/text_theme.dart';
import 'package:dsa_learning/presentation/initial/main/learn/lesson/widgets/knowledge_check/progress_bar_component.dart';
import 'package:dsa_learning/presentation/widgets/main_container.dart';
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
    required this.vents,
    super.key,
  });

  final VoidCallback updateTimer;
  final int time;
  final String gameName;
  final double value;
  final int questionsNum;
  final List<bool> gameProgress;
  final int vents;

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
      height: 190,
      borderRadius: 14,
      color: colorScheme.onSurface.withValues(alpha: 0.4),
      padding: const EdgeInsetsDirectional.only(
        start: 20,
        top: 20,
        end: 10,
        bottom: 10,
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
                ProgressBarComponent(
                  vents: widget.vents,
                  time: widget.time,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
