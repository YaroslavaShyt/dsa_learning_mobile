import 'package:dsa_learning/core/constants/image_assets.dart';
import 'package:dsa_learning/core/utils/theme/app_color_theme.dart';
import 'package:dsa_learning/core/utils/theme/text_theme.dart';
import 'package:dsa_learning/presentation/widgets/main_container.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class PlanContainer extends StatelessWidget {
  const PlanContainer({
    required this.planStep1,
    required this.planStep2,
    required this.planStep3,
    required this.planStep4,
    super.key,
  });

  final String planStep1;
  final String planStep2;
  final String planStep3;
  final String planStep4;

  @override
  Widget build(BuildContext context) {
    final ColorScheme colorScheme = getColorScheme(context);
    final TextTheme textTheme = getTextTheme(context);

    return Positioned(
      left: 10,
      right: 10,
      top: 160,
      child: MainContainer(
        padding: const EdgeInsetsDirectional.symmetric(
          horizontal: 20,
          vertical: 16,
        ),
        content: Column(
          spacing: 8,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              spacing: 10,
              children: [
                Text(
                  context.tr("plan"),
                  style: textTheme.labelMedium?.copyWith(
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                Image.asset(
                  height: 30,
                  width: 30,
                  ImageAssets.book,
                )
              ],
            ),
            Row(
              children: [
                const SizedBox(width: 10),
                Flexible(
                  child: Text(
                    planStep1,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: textTheme.labelMedium?.copyWith(
                      fontSize: 16,
                    ),
                  ),
                ),
                Radio(
                  activeColor: colorScheme.onSurface,
                  value: '',
                  groupValue: '',
                  onChanged: (v) {},
                ),
              ],
            ),
            Row(
              children: [
                const SizedBox(width: 20),
                Radio(
                  activeColor: colorScheme.onSurface,
                  value: '',
                  groupValue: '',
                  onChanged: (v) {},
                ),
                Flexible(
                  child: Text(
                    planStep2,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: textTheme.labelMedium?.copyWith(
                      fontSize: 16,
                    ),
                  ),
                ),
              ],
            ),
            Row(
              children: [
                const SizedBox(width: 10),
                Flexible(
                  child: Text(
                    planStep3,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: textTheme.labelMedium?.copyWith(
                      fontSize: 16,
                    ),
                  ),
                ),
                Radio(
                  activeColor: colorScheme.onSurface,
                  value: '',
                  groupValue: '',
                  onChanged: (v) {},
                ),
              ],
            ),
            Row(
              children: [
                const SizedBox(width: 20),
                Radio(
                  activeColor: colorScheme.onSurface,
                  value: '',
                  groupValue: '',
                  onChanged: (v) {},
                ),
                Flexible(
                  child: Text(
                    planStep4,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: textTheme.labelMedium?.copyWith(
                      fontSize: 16,
                    ),
                  ),
                ),
              ],
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  context.tr("knowledgeCheck"),
                  style: textTheme.labelMedium?.copyWith(
                    fontSize: 16,
                    color: colorScheme.primaryFixed,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const SizedBox(width: 6),
                Image.asset(
                  height: 40,
                  width: 40,
                  ImageAssets.savyy,
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
