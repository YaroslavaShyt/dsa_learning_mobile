import 'package:dsa_learning/core/utils/theme/app_color_theme.dart';
import 'package:flutter/material.dart';

class PopUp {
  static void show({
    required BuildContext context,
    String? subtitle,
    VoidCallback? onNegativePressed,
    VoidCallback? onPositivePressed,
    VoidCallback? onTapOutside,
    double height = 200,
    Widget? child,
  }) {
    final ColorScheme colorScheme = getColorScheme(context);
    showDialog(
      context: context,
      builder: (_) {
        return Dialog(
          child: Container(
            height: height,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              border: Border.all(
                width: 4,
                color: colorScheme.onSurface.withValues(alpha: 0.4),
              ),
            ),
            child: child,
          ),
        );
      },
    );
  }
}
