import 'package:auto_size_text_plus/auto_size_text_plus.dart';
import 'package:dsa_learning/core/utils/theme/text_theme.dart';
import 'package:dsa_learning/data/game/task.dart';
import 'package:flutter/material.dart';

class GameQuestion extends StatelessWidget {
  const GameQuestion({
    required this.step,
    required this.question,
    required this.level,
    super.key,
  });

  final int step;
  final String question;
  final TaskLevel level;

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = getTextTheme(context);

    return SizedBox(
      height: 130,
      width: MediaQuery.sizeOf(context).width,
      child: Column(
        children: [
          Text(_level),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Flexible(
                child: AutoSizeText(
                  question,
                  minFontSize: 12,
                  maxFontSize: 16,
                  textAlign: TextAlign.center,
                  style: textTheme.bodyMedium?.copyWith(
                    fontWeight: FontWeight.w700,
                    fontSize: 16,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  String get _level {
    return switch (level) {
      TaskLevel.hard => "Складний рівень",
      TaskLevel.medium => "Середній рівень",
      TaskLevel.easy => "Легкий рівень",
    };
  }
}
