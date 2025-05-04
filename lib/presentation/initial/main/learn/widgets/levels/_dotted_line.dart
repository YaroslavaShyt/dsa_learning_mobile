import 'package:dotted_line/dotted_line.dart';
import 'package:dsa_learning/core/utils/theme/app_color_theme.dart';
import 'package:dsa_learning/presentation/initial/main/learn/widgets/levels/_pattern.dart';
import 'package:flutter/material.dart';

class MainDottedLine extends StatelessWidget {
  const MainDottedLine({required this.position, super.key});

  final Position position;

  @override
  Widget build(BuildContext context) {
    final ColorScheme colorScheme = getColorScheme(context);

    return Positioned(
      bottom: position.bottom,
      left: position.left,
      child: RotationTransition(
        turns: AlwaysStoppedAnimation(position.rotation! / 360),
        child: DottedLine(
          lineLength: 70,
          dashColor: colorScheme.onSurface,
        ),
      ),
    );
  }
}
