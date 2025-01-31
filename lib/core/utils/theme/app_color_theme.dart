import 'package:dsa_learning/core/utils/theme/color_palette.dart';
import 'package:flutter/material.dart';

class AppColorTheme {
  static ThemeData theme = ThemeData(
    colorScheme: _lightColorScheme,
  );

  static final ColorScheme _lightColorScheme = ColorScheme(
    surface: ColorPalette.rebeccaPurple,
    onSurface: ColorPalette.white,
    primary: ColorPalette.rebeccaPurple,
    onPrimary: ColorPalette.white,
    error: ColorPalette.crayola,
    secondary: ColorPalette.mintGreen,
    onSecondary: Colors.black,
    onError: ColorPalette.white,
    brightness: Brightness.light,
  );
}
