import 'package:dsa_learning/core/utils/theme/app_color_theme.dart';
import 'package:flutter/material.dart';

TextTheme getTextTheme(BuildContext context) => TextTheme(
  bodyMedium: _TextTheme.bodyMedium(context),
  labelMedium: _TextTheme.labelMedium(context),
  labelSmall: _TextTheme.labelSmall(context),
);

class _TextTheme{
  static TextStyle bodyMedium(context) => TextStyle(
    fontSize: 20,
    shadows: [
      BoxShadow(
        color: getColorScheme(context).shadow.withValues(alpha: 0.2),
        offset: Offset(4, 4),
        blurRadius: 8,
        spreadRadius: 1,
      ),
    ]
  );

  static TextStyle labelMedium(context) => TextStyle(
      fontSize: 16,
      shadows: [
        BoxShadow(
          color: getColorScheme(context).shadow.withValues(alpha: 0.2),
          offset: Offset(4, 4),
          blurRadius: 8,
          spreadRadius: 1,
        ),
      ]
  );

  static TextStyle labelSmall(context) => TextStyle(
      fontSize: 14,
      shadows: [
        BoxShadow(
          color: getColorScheme(context).shadow.withValues(alpha: 0.2),
          offset: Offset(4, 4),
          blurRadius: 8,
          spreadRadius: 1,
        ),
      ]
  );
}