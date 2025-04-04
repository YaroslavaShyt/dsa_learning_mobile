import 'package:dsa_learning/core/utils/theme/color_palette.dart';
import 'package:dsa_learning/core/utils/theme/scroll_bar_theme.dart';
import 'package:flutter/material.dart';

ColorScheme getColorScheme(BuildContext context) =>
    Theme.of(context).colorScheme;

class AppColorTheme {
  static ThemeData theme(BuildContext context) => ThemeData(
        fontFamily: 'Nunito',
        colorScheme: _lightColorScheme,
        scrollbarTheme: const ScrollbarThemeData().copyWith(
          thumbVisibility: const WidgetStatePropertyAll(true),
          trackVisibility: const WidgetStatePropertyAll(true),
          thumbColor: WidgetStateProperty.all(_lightColorScheme.onSurface),
          trackBorderColor:
              WidgetStateProperty.all(_lightColorScheme.onSurface),
          trackColor: WidgetStateProperty.all(_lightColorScheme.onSurface),
          thickness: const WidgetStatePropertyAll(8),
          radius: const Radius.circular(4),
        ),
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
    shadow: ColorPalette.shadow,
    primaryFixed: ColorPalette.maize,
    primaryFixedDim: ColorPalette.crayola,
    onSecondaryContainer: ColorPalette.neatBlue,
    onInverseSurface: ColorPalette.lavanda,
  );
}
