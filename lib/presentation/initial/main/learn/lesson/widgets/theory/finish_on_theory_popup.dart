import 'package:dsa_learning/core/utils/theme/app_color_theme.dart';
import 'package:dsa_learning/core/utils/theme/text_theme.dart';
import 'package:dsa_learning/presentation/widgets/buttons/main_outlined_button.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class FinishOnTheoryPopup extends StatelessWidget {
  const FinishOnTheoryPopup({
    required this.onConfirmTap,
    required this.onCancelTap,
    required this.isLessonLearned,
    super.key,
  });

  final VoidCallback onConfirmTap;
  final VoidCallback onCancelTap;
  final bool isLessonLearned;

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = getTextTheme(context);
    final ColorScheme colorScheme = getColorScheme(context);

    return Padding(
      padding: const EdgeInsetsDirectional.symmetric(horizontal: 8.0),
      child: Column(
        spacing: 8,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsetsDirectional.only(top: 18.0),
            child: Align(
              alignment: Alignment.center,
              child: Text(
                context.tr("endLesson"),
                style: textTheme.titleLarge?.copyWith(
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  context.tr("doYouWantEndLesson"),
                  textAlign: TextAlign.center,
                  style: textTheme.titleLarge?.copyWith(
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                if (!isLessonLearned)
                  Text(
                    context.tr("allTheRewardsWillBeLost"),
                    textAlign: TextAlign.center,
                    style: textTheme.titleLarge?.copyWith(
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsetsDirectional.only(bottom: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                MainOutlinedButton(
                  isActive: false,
                  width: 60,
                  onPressed: onConfirmTap,
                  child: Text(
                    context.tr("yes"),
                    style: textTheme.labelSmall?.copyWith(
                      color: colorScheme.onSurface.withValues(alpha: 0.6),
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
                MainOutlinedButton(
                  width: 60,
                  onPressed: onCancelTap,
                  child: Text(
                    context.tr("no"),
                    style: textTheme.labelSmall?.copyWith(
                      color: colorScheme.primaryFixed,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
