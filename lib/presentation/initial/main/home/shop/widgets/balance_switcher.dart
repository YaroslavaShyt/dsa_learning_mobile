import 'package:dsa_learning/core/utils/theme/app_color_theme.dart';
import 'package:dsa_learning/core/utils/theme/text_theme.dart';
import 'package:dsa_learning/presentation/widgets/animated_gestures/tap_animated_widget.dart';
import 'package:dsa_learning/presentation/widgets/main_shadow.dart';
import 'package:flutter/material.dart';

class BalanceSwitcher extends StatelessWidget {
  const BalanceSwitcher({
    required this.value,
    required this.onIncrement,
    required this.onDecrement,
    super.key,
  });

  final int value;
  final VoidCallback onIncrement;
  final VoidCallback onDecrement;

  @override
  Widget build(BuildContext context) {
    final ColorScheme colorScheme = getColorScheme(context);
    final TextTheme textTheme = getTextTheme(context);

    return Container(
      decoration: BoxDecoration(
        color: colorScheme.primaryFixed,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [mainBoxShadow(context)],
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          _buildButton(
            context,
            text: '-',
            onTap: onDecrement,
          ),
          Text(
            '${value}x',
            style: textTheme.bodyMedium?.copyWith(
              color: colorScheme.surface,
              fontSize: 16,
              fontWeight: FontWeight.w700,
            ),
          ),
          _buildButton(
            context,
            text: '+',
            onTap: onIncrement,
          ),
        ],
      ),
    );
  }

  Widget _buildButton(
    BuildContext context, {
    required String text,
    required VoidCallback onTap,
  }) {
    final ColorScheme colorScheme = getColorScheme(context);
    final TextTheme textTheme = getTextTheme(context);

    return TapAnimatedWidget(
      onTap: onTap,
      child: Container(
        height: 30,
        width: 30,
        margin: const EdgeInsetsDirectional.all(4),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: colorScheme.surface,
          boxShadow: [mainBoxShadow(context)],
        ),
        child: Center(
          child: Text(
            text,
            style: textTheme.bodyMedium?.copyWith(
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
      ),
    );
  }
}
