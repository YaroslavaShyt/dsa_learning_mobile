import 'package:auto_size_text_plus/auto_size_text_plus.dart';
import 'package:dsa_learning/core/utils/theme/app_color_theme.dart';
import 'package:dsa_learning/core/utils/theme/text_theme.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({
    required this.currentStep,
    required this.totalSteps,
    this.title,
    this.description,
    this.onNextButtonPressed,
    super.key,
  });

  final int currentStep;
  final int totalSteps;
  final String? title;
  final String? description;
  final VoidCallback? onNextButtonPressed;

  @override
  Widget build(BuildContext context) {
    final ColorScheme colorScheme = getColorScheme(context);
    final TextTheme textTheme = getTextTheme(context);

    return Center(
      child: Container(
        height: 130,
        padding: const EdgeInsetsDirectional.only(
          start: 16,
          top: 20,
          end: 16,
          bottom: 10,
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
          children: [
            Row(
              spacing: 4,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "$currentStep/$totalSteps",
                  style: const TextStyle(color: Colors.white),
                ),
                if (title != null)
                  Flexible(
                    child: Text(
                      context.tr(title!),
                      textAlign: TextAlign.center,
                      style: const TextStyle(color: Colors.white),
                    ),
                  ),
                if (description != null)
                  Flexible(
                    child: AutoSizeText(
                      context.tr(description!),
                      maxLines: 2,
                      maxFontSize: 14,
                      minFontSize: 13,
                      textAlign: TextAlign.center,
                      style: const TextStyle(color: Colors.white),
                    ),
                  ),
                const SizedBox(width: 20),
              ],
            ),
            if (onNextButtonPressed != null)
              Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: onNextButtonPressed!,
                  child: Text(
                    context.tr('next'),
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
      ),
    );
  }
}
