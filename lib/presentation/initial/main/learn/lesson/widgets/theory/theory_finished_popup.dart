import 'package:dsa_learning/core/constants/image_assets.dart';
import 'package:dsa_learning/core/utils/theme/app_color_theme.dart';
import 'package:dsa_learning/core/utils/theme/text_theme.dart';
import 'package:dsa_learning/presentation/widgets/buttons/main_outlined_button.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class TheoryFinishedPopup extends StatelessWidget {
  const TheoryFinishedPopup({
    required this.onConfirmTap,
    required this.onCancelTap,
    required this.bytes,
    required this.hash,
    required this.vents,
    super.key,
  });

  final VoidCallback onConfirmTap;
  final VoidCallback onCancelTap;
  final int bytes;
  final int hash;
  final int vents;

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
          Expanded(
            child: Align(
              alignment: Alignment.center,
              child: Text(
                context.tr("niceJob"),
                style: textTheme.titleLarge?.copyWith(
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ),
          Text(
            context.tr("allTheoryIsLearned"),
            textAlign: TextAlign.center,
            style: textTheme.titleLarge?.copyWith(
              fontSize: 16,
              fontWeight: FontWeight.w700,
            ),
          ),
          Row(
            children: [
              if (bytes != 0 || hash != 0 || vents != 0)
                Text(
                  '${context.tr("reward")}:    ',
                  textAlign: TextAlign.center,
                  style: textTheme.titleLarge?.copyWith(
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              if (bytes > 0) ...[
                Text(
                  '${bytes.toString()}x',
                  style: textTheme.titleLarge?.copyWith(
                    fontSize: 16,
                    color: colorScheme.primaryFixed,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                Image.asset(
                  height: 16,
                  width: 16,
                  ImageAssets.bytes,
                ),
              ],
              if (hash > 0) ...[
                Text(
                  '${hash.toString()}x',
                  style: textTheme.titleLarge?.copyWith(
                    fontSize: 16,
                    color: colorScheme.primaryFixed,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                Image.asset(
                  height: 16,
                  width: 16,
                  ImageAssets.hash,
                ),
              ],
              if (vents > 0) ...[
                Text(
                  '${vents.toString()}x',
                  style: textTheme.titleLarge?.copyWith(
                    fontSize: 16,
                    color: colorScheme.primaryFixed,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                Image.asset(
                  height: 16,
                  width: 16,
                  ImageAssets.vents,
                ),
              ]
            ],
          ),
          Text(
            context.tr("letsCheckTheKnowledge"),
            textAlign: TextAlign.center,
            style: textTheme.titleLarge?.copyWith(
              fontSize: 16,
              fontWeight: FontWeight.w700,
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
                  onPressed: onCancelTap,
                  child: Text(
                    context.tr("later"),
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
                    context.tr("letsGo"),
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
