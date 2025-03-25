import 'package:dsa_learning/core/constants/image_assets.dart';
import 'package:dsa_learning/core/utils/theme/app_color_theme.dart';
import 'package:dsa_learning/core/utils/theme/text_theme.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class RewardRow extends StatelessWidget {
  const RewardRow({
    required this.bytes,
    required this.hash,
    required this.fan,
    super.key,
  });

  final int bytes;
  final int hash;
  final int fan;

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = getTextTheme(context);
    final ColorScheme colorScheme = getColorScheme(context);

    if (bytes == 0 && hash == 0 && fan == 0) {
      return const SizedBox.shrink();
    }

    return Column(
      spacing: 10,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '${context.tr('reward')}: ',
          style: textTheme.titleLarge?.copyWith(
            color: colorScheme.onSurface,
            fontSize: 18,
            fontWeight: FontWeight.w700,
          ),
        ),
        Row(
          children: [
            if (bytes > 0) ...[
              Padding(
                padding: const EdgeInsetsDirectional.only(bottom: 18.0),
                child: Text(
                  '+${bytes}X',
                  style: textTheme.titleLarge?.copyWith(
                    color: colorScheme.primaryFixed,
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              Image.asset(
                height: 50,
                width: 50,
                ImageAssets.bytes,
              ),
            ],
            if (hash > 0) ...[
              Padding(
                padding: const EdgeInsetsDirectional.only(bottom: 18.0),
                child: Text(
                  '+${hash}X',
                  style: textTheme.titleLarge?.copyWith(
                    color: colorScheme.primaryFixed,
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              Image.asset(
                height: 50,
                width: 50,
                ImageAssets.hash,
              ),
            ],
            if (fan > 0) ...[
              Padding(
                padding: const EdgeInsetsDirectional.only(bottom: 18.0),
                child: Text(
                  '+${fan}X',
                  style: textTheme.titleLarge?.copyWith(
                    color: colorScheme.primaryFixed,
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              Image.asset(
                height: 50,
                width: 50,
                ImageAssets.vents,
              ),
            ],
          ],
        ),
      ],
    );
  }
}
