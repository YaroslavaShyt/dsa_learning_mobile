import 'package:dsa_learning/core/utils/theme/app_color_theme.dart';
import 'package:dsa_learning/core/utils/theme/text_theme.dart';
import 'package:flutter/material.dart';

class MainSnackBar extends SnackBar {
  MainSnackBar({
    required this.text,
    required this.color,
    super.key,
  }) : super(
          content: _SnackBarContent(
            text: text,
          ),
          backgroundColor: color,
        );

  final String text;
  final Color color;
}

class _SnackBarContent extends StatelessWidget {
  const _SnackBarContent({
    required this.text,
  });

  final String text;

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = getTextTheme(context);
    final ColorScheme colorScheme = getColorScheme(context);

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        color: Colors.transparent,
        border: Border.all(
          color: colorScheme.primaryFixed,
          width: 3,
        ),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Text(
        text,
        style: textTheme.labelMedium?.copyWith(
          color: colorScheme.onSurface,
          fontWeight: FontWeight.w700,
        ),
      ),
    );
  }
}
