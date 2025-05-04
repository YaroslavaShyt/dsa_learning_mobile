import 'package:dsa_learning/core/utils/theme/app_color_theme.dart';
import 'package:dsa_learning/presentation/widgets/snack_bar.dart';
import 'package:flutter/material.dart';

mixin SnackBarMixin {
  void showSnackBar(
    BuildContext context, {
    required String text,
  }) {
    final ColorScheme colorScheme = getColorScheme(context);

    ScaffoldMessenger.of(context).showSnackBar(
      MainSnackBar(
        text: text,
        color: colorScheme.surface,
      ),
    );
  }
}
