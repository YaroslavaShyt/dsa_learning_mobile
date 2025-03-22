import 'package:dsa_learning/core/utils/theme/app_color_theme.dart';
import 'package:dsa_learning/core/utils/theme/text_theme.dart';
import 'package:dsa_learning/presentation/widgets/buttons/main_outlined_button.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class Buttons extends StatelessWidget {
  const Buttons({
    required this.onBackButtonTap,
    required this.onNextButtonTap,
    required this.onPauseButtonTap,
    super.key,
  });

  final VoidCallback onPauseButtonTap;
  final VoidCallback onNextButtonTap;
  final VoidCallback onBackButtonTap;

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = getTextTheme(context);
    final ColorScheme colorScheme = getColorScheme(context);
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _buildButton(
          textTheme,
          colorScheme.onSurface.withValues(alpha: 0.8),
          title: context.tr('back'),
          onPressed: onBackButtonTap,
          isActive: false,
        ),
        _buildButton(
          textTheme,
          colorScheme.onSurface.withValues(alpha: 0.6),
          title: context.tr('pause'),
          onPressed: onNextButtonTap,
          isActive: false,
        ),
        _buildButton(
          textTheme,
          colorScheme.primaryFixed,
          title: context.tr('next'),
          onPressed: onNextButtonTap,
          isActive: true,
        ),
      ],
    );
  }

  Widget _buildButton(
    TextTheme textTheme,
    Color color, {
    required bool isActive,
    required String title,
    required VoidCallback onPressed,
  }) {
    return MainOutlinedButton(
      width: 60,
      color: color,
      onPressed: onPressed,
      child: Text(
        title,
        style: textTheme.labelSmall?.copyWith(
          color: color,
          fontSize: 16,
          fontWeight: FontWeight.w700,
        ),
      ),
    );
  }
}
