import 'package:dsa_learning/core/utils/theme/app_color_theme.dart';
import 'package:flutter/material.dart';

class AppBottomSheet {
  static void show(
    BuildContext context, {
    Widget? child,
    double height = 600,
  }) {
    final ColorScheme colorScheme = getColorScheme(context);
    showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      builder: (_) {
        return Wrap(
          children: [
            Container(
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
          ],
        );
      },
    );
  }
}
