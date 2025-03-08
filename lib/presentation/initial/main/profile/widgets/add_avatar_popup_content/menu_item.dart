import 'package:dsa_learning/core/utils/theme/app_color_theme.dart';
import 'package:dsa_learning/core/utils/theme/text_theme.dart';
import 'package:dsa_learning/presentation/widgets/animated_gestures/tap_animated_widget.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class MenuItem extends StatelessWidget {
  const MenuItem({
    required this.icon,
    required this.title,
    required this.onTap,
    this.showDivider = false,
    super.key,
  });

  final IconData icon;
  final String title;
  final VoidCallback onTap;
  final bool showDivider;

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = getTextTheme(context);
    final ColorScheme colorScheme = getColorScheme(context);
    return TapAnimatedWidget(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsetsDirectional.only(bottom: 10),
        decoration: BoxDecoration(
          border: Border(
            bottom: showDivider
                ? BorderSide(
                    color: colorScheme.onSurface.withValues(alpha: 0.5),
                    width: 1.2,
                  )
                : BorderSide.none,
          ),
        ),
        child: Row(
          children: [
            Icon(
              icon,
              color: colorScheme.onSurface,
            ),
            const SizedBox(width: 10),
            Text(
              context.tr(title),
              style: textTheme.labelSmall?.copyWith(
                  // fontWeight: FontWeight.w700,
                  ),
            ),
          ],
        ),
      ),
    );
  }
}
