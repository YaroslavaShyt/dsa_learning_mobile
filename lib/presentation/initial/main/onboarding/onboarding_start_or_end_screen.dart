import 'package:dsa_learning/core/utils/theme/app_color_theme.dart';
import 'package:dsa_learning/core/utils/theme/text_theme.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class OnboardingStartOrEndScreen extends StatelessWidget {
  const OnboardingStartOrEndScreen({
    required this.title,
    this.onNextButtonPressed,
    this.isFinish = false,
    super.key,
  });

  final bool isFinish;
  final String title;
  final VoidCallback? onNextButtonPressed;

  @override
  Widget build(BuildContext context) {
    final ColorScheme colorScheme = getColorScheme(context);
    final TextTheme textTheme = getTextTheme(context);

    final double width = MediaQuery.of(context).size.width;

    return Container(
      width: width,
      height: 120,
      padding: const EdgeInsetsDirectional.symmetric(
        horizontal: 10,
        vertical: 6,
      ),
      decoration: BoxDecoration(
        color: colorScheme.surface,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: colorScheme.onInverseSurface,
          width: 2,
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(height: 10),
          Flexible(
            child: Text(
              context.tr(title),
              textAlign: TextAlign.center,
            ),
          ),
          if (onNextButtonPressed != null)
            Align(
              alignment: Alignment.centerRight,
              child: TextButton(
                onPressed: onNextButtonPressed!,
                child: Text(
                  context.tr(isFinish ? 'finish' : 'next'),
                  style: textTheme.bodyMedium?.copyWith(
                    color: colorScheme.primaryFixed,
                    fontSize: 12,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
