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

    return SizedBox(
      width: double.infinity,
      child: Column(
        spacing: 4,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '${context.tr('myBalance')}:',
            style: textTheme.bodyMedium?.copyWith(
              fontSize: 14,
            ),
          ),
          Wrap(
            children: [
              _buildCurrency('bytes', ImageAssets.bytes, bytes, context),
              _buildCurrency('hash', ImageAssets.hash, hash, context),
              _buildCurrency('vents', ImageAssets.vents, vents, context),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildCurrency(
    String name,
    String image,
    int quantity,
    BuildContext context,
  ) {
    final TextTheme textTheme = getTextTheme(context);
    final ColorScheme colorScheme = getColorScheme(context);

    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Image.asset(
          height: 40,
          width: 40,
          image,
        ),
        Text(
          '${context.tr(name)}:  ',
        ),
        Text(
          '${quantity}X:',
          style: textTheme.bodyMedium?.copyWith(
            color: colorScheme.primaryFixed,
            fontWeight: FontWeight.w700,
            fontSize: 16,
          ),
        ),
      ],
    );
  }
}
