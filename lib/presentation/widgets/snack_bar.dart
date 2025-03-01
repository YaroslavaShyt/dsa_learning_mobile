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
    return Text(
      text,
      style: getTextTheme(context).labelMedium?.copyWith(
            color: getColorScheme(context).onSurface.withValues(alpha: 1),
            fontWeight: FontWeight.w700,
          ),
    );
  }
}
