import 'package:dsa_learning/core/utils/theme/app_color_theme.dart';
import 'package:dsa_learning/core/utils/theme/text_theme.dart';
import 'package:dsa_learning/presentation/widgets/buttons/main_outlined_button.dart';
import 'package:flutter/material.dart';

class Buttons extends StatelessWidget {
  const Buttons({
    required this.onLeftButtonTap,
    required this.onRightButtonTap,
    super.key,
  });

  final VoidCallback onLeftButtonTap;
  final VoidCallback onRightButtonTap;

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = getTextTheme(context);
    final ColorScheme colorScheme = getColorScheme(context);
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _buildButton(
          textTheme,
          colorScheme,
          title: 'Пауза',
          onPressed: onLeftButtonTap,
          isActive: false,
        ),
        _buildButton(
          textTheme,
          colorScheme,
          title: 'Далі',
          onPressed: onRightButtonTap,
          isActive: true,
        ),
      ],
    );
  }

  Widget _buildButton(
    TextTheme textTheme,
    ColorScheme colorScheme, {
    required bool isActive,
    required String title,
    required VoidCallback onPressed,
  }) {
    return MainOutlinedButton(
      width: 70,
      isActive: isActive,
      onPressed: onPressed,
      child: Text(
        title,
        style: textTheme.labelSmall?.copyWith(
          color: isActive ? colorScheme.primaryFixed : colorScheme.onSurface,
          fontSize: 16,
          fontWeight: FontWeight.w700,
        ),
      ),
    );
  }
}
