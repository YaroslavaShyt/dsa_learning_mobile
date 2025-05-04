import 'package:dsa_learning/core/utils/theme/app_color_theme.dart';
import 'package:dsa_learning/core/utils/theme/text_theme.dart';
import 'package:dsa_learning/presentation/widgets/buttons/main_outlined_button.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class ConfirmDeleteAccountContent extends StatelessWidget {
  const ConfirmDeleteAccountContent({
    required this.onCancelTap,
    required this.onConfirmTap,
    super.key,
  });

  final VoidCallback onConfirmTap;
  final VoidCallback onCancelTap;

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = getTextTheme(context);
    final ColorScheme colorScheme = getColorScheme(context);

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
          child: Align(
            alignment: Alignment.center,
            child: Text(
              context.tr("doYouWantDeleteAccount"),
              textAlign: TextAlign.center,
              style: textTheme.titleLarge?.copyWith(
                fontSize: 18,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsetsDirectional.only(bottom: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              MainOutlinedButton(
                isActive: false,
                width: 50,
                onPressed: onConfirmTap,
                child: Text(
                  context.tr("yes"),
                  style: textTheme.labelSmall?.copyWith(
                    color: colorScheme.onSurface,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              MainOutlinedButton(
                width: 50,
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
    );
  }
}
