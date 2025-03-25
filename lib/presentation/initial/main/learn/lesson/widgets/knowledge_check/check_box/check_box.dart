import 'package:dsa_learning/presentation/initial/main/learn/lesson/widgets/knowledge_check/check_box/check_box_painter.dart';
import 'package:flutter/material.dart';

class MainCheckbox extends StatelessWidget {
  final bool isCorrect;
  final bool isChecked;
  final double size;

  const MainCheckbox({
    required this.isCorrect,
    required this.isChecked,
    super.key,
    this.size = 50.0,
  });

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      size: Size(size, size),
      painter: CustomCheckboxPainter(
        isCorrect: isCorrect,
        isChecked: isChecked,
        size: size,
      ),
    );
  }
}
