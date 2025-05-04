import 'package:dsa_learning/core/utils/theme/app_color_theme.dart';
import 'package:flutter/material.dart';

TextTheme getTextTheme(BuildContext context) => TextTheme(
      bodyMedium: _TextTheme.bodyMedium(context),
      labelMedium: _TextTheme.labelMedium(context),
      labelSmall: _TextTheme.labelSmall(context),
      titleLarge: _TextTheme.titleLarge(context),
    );

class _TextTheme {
  static Color _getTextColor(BuildContext context) {
    return getColorScheme(context).shadow.withValues(alpha: 0.2);
  }

  static List<BoxShadow> _getTextShadow(BuildContext context) {
    return [
      BoxShadow(
        color: _getTextColor(context),
        offset: const Offset(4, 4),
        blurRadius: 8,
        spreadRadius: 1,
      ),
    ];
  }

  static TextStyle titleLarge(context) => TextStyle(
        fontSize: 24,
        shadows: _getTextShadow(context),
      );

  static TextStyle bodyMedium(context) => TextStyle(
        fontSize: 20,
        shadows: _getTextShadow(context),
      );

  static TextStyle labelMedium(context) => TextStyle(
        fontSize: 16,
        shadows: _getTextShadow(context),
      );

  static TextStyle labelSmall(context) => TextStyle(
        fontSize: 14,
        shadows: _getTextShadow(context),
      );
}
