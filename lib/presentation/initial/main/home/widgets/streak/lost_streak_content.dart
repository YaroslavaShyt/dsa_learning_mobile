import 'package:dsa_learning/core/utils/theme/app_color_theme.dart';
import 'package:dsa_learning/core/utils/theme/text_theme.dart';
import 'package:dsa_learning/presentation/widgets/buttons/main_outlined_button.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class LostStreakContent extends StatelessWidget {
  const LostStreakContent({
    required this.onCloseButtonTap,
    required this.onConfirmTap,
    required this.onCancelTap,
    super.key,
  });

  final VoidCallback onCloseButtonTap;
  final VoidCallback onCancelTap;
  final VoidCallback onConfirmTap;

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = getTextTheme(context);
    final ColorScheme colorScheme = getColorScheme(context);

    return Padding(
      padding: const EdgeInsetsDirectional.all(8.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        spacing: 10,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const SizedBox(width: 30),
              Text(
                context.tr('streak'),
                style: textTheme.bodyMedium?.copyWith(
                  fontWeight: FontWeight.w700,
                ),
              ),
              CloseButton(
                onPressed: onCloseButtonTap,
              ),
            ],
          ),
          Text(
            context.tr('youMissedOneDay'),
            textAlign: TextAlign.center,
            style: textTheme.bodyMedium?.copyWith(
              fontSize: 16,
              fontWeight: FontWeight.w700,
            ),
          ),
          Text(
            context.tr('wouldYouLikeToUseHash'),
            textAlign: TextAlign.center,
            style: textTheme.bodyMedium?.copyWith(
              fontSize: 16,
              fontWeight: FontWeight.w700,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              MainOutlinedButton(
                isActive: false,
                width: 60,
                onPressed: onCancelTap,
                child: Text(
                  context.tr("no"),
                  style: textTheme.labelSmall?.copyWith(
                    color: colorScheme.onSurface,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              MainOutlinedButton(
                width: 60,
                onPressed: onConfirmTap,
                child: Text(
                  context.tr("yes"),
                  style: textTheme.labelSmall?.copyWith(
                    color: colorScheme.primaryFixed,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
