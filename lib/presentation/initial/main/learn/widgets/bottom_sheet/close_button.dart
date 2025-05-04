import 'package:dsa_learning/core/utils/theme/app_color_theme.dart';
import 'package:dsa_learning/presentation/widgets/main_shadow.dart';
import 'package:flutter/material.dart';

class AppCloseButton extends StatelessWidget {
  const AppCloseButton({
    required this.onCloseButtonTap,
    super.key,
  });

  final VoidCallback onCloseButtonTap;

  @override
  Widget build(BuildContext context) {
    final ColorScheme colorScheme = getColorScheme(context);

    return Positioned(
      top: 0,
      right: 10,
      child: IconButton(
        icon: Icon(
          Icons.close_rounded,
          color: colorScheme.onSurface,
          shadows: [mainBoxShadow(context)],
        ),
        onPressed: onCloseButtonTap,
      ),
    );
  }
}
