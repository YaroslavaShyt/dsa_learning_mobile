import 'package:dsa_learning/core/constants/image_assets.dart';
import 'package:dsa_learning/core/utils/theme/app_color_theme.dart';
import 'package:dsa_learning/core/utils/theme/text_theme.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class MyBalanceWidget extends StatelessWidget {
  const MyBalanceWidget({
    required this.vents,
    required this.hash,
    required this.bytes,
    super.key,
  });

  final int bytes;
  final int vents;
  final int hash;

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = getTextTheme(context);
    final ColorScheme colorScheme = getColorScheme(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          context.tr('myBalance'),
        ),
        Wrap(
          children: [
            Image.asset(
              height: 40,
              width: 40,
              ImageAssets.bytes,
            ),
            Text(
              '${context.tr('bytes')}: ',
            ),
            Text(
              '${bytes}X',
              style: textTheme.bodyMedium?.copyWith(
                color: colorScheme.primaryFixed,
                fontSize: 16,
              ),
            ),
            Image.asset(
              height: 40,
              width: 40,
              ImageAssets.hash,
            ),
            Text(
              '${context.tr('hash')}: ',
            ),
            Text(
              '${hash}X:',
              style: textTheme.bodyMedium?.copyWith(
                color: colorScheme.primaryFixed,
                fontSize: 16,
              ),
            ),
            Row(
              children: [
                Image.asset(
                  height: 40,
                  width: 40,
                  ImageAssets.vents,
                ),
                Text(
                  '${context.tr('vents')}: ',
                ),
                Text(
                  '${vents}X:',
                  style: textTheme.bodyMedium?.copyWith(
                    color: colorScheme.primaryFixed,
                    fontSize: 16,
                  ),
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
