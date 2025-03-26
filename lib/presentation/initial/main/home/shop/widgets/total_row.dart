import 'package:dsa_learning/core/constants/image_assets.dart';
import 'package:dsa_learning/core/utils/theme/app_color_theme.dart';
import 'package:dsa_learning/core/utils/theme/text_theme.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class TotalRow extends StatelessWidget {
  const TotalRow({
    required this.bytes,
    super.key,
  });

  final int bytes;

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = getTextTheme(context);
    final ColorScheme colorScheme = getColorScheme(context);

    return Row(
      children: [
        Text(
          '${context.tr('total')}: ',
          style: textTheme.bodyMedium?.copyWith(
            fontWeight: FontWeight.w700,
            fontSize: 16,
          ),
        ),
        Text(
          '${bytes}X',
          style: textTheme.bodyMedium?.copyWith(
            color: colorScheme.primaryFixed,
            fontSize: 16,
          ),
        ),
        Image.asset(
          height: 50,
          width: 50,
          ImageAssets.bytes,
        ),
      ],
    );
  }
}
