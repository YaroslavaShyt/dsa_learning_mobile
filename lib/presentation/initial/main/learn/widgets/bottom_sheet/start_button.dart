import 'package:dsa_learning/core/utils/theme/app_color_theme.dart';
import 'package:dsa_learning/core/utils/theme/text_theme.dart';
import 'package:dsa_learning/presentation/widgets/animated_gestures/tap_animated_widget.dart';
import 'package:dsa_learning/presentation/widgets/buttons/main_outlined_button.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class StartButton extends StatelessWidget {
  const StartButton({
    this.onStartTap,
    super.key,
  });

  final VoidCallback? onStartTap;

  @override
  Widget build(BuildContext context) {
    final ColorScheme colorScheme = getColorScheme(context);
    final TextTheme textTheme = getTextTheme(context);
    return Positioned(
      right: 10,
      bottom: 20,
      child: SizedBox(
        height: 60,
        width: 200,
        child: TapAnimatedWidget(
          onTap: onStartTap,
          child: MainOutlinedButton(
            onPressed: onStartTap ?? () {},
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  context.tr('start'),
                  style: textTheme.labelMedium?.copyWith(
                    color: getColorScheme(context).primaryFixed,
                    fontWeight: FontWeight.w700,
                    fontSize: 20,
                  ),
                ),
                Icon(
                  Icons.arrow_forward_ios_rounded,
                  color: colorScheme.primaryFixed,
                  size: 30,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
