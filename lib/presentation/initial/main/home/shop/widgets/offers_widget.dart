import 'package:dsa_learning/core/constants/image_assets.dart';
import 'package:dsa_learning/core/utils/theme/text_theme.dart';
import 'package:dsa_learning/presentation/initial/main/home/shop/widgets/balance_switcher.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class OffersWidget extends StatelessWidget {
  const OffersWidget({
    required this.onHashDecrement,
    required this.onHashIncrement,
    required this.onVentsDecrement,
    required this.onVentsIncrement,
    required this.hash,
    required this.vents,
    super.key,
  });

  final int vents;
  final int hash;
  final VoidCallback onVentsIncrement;
  final VoidCallback onHashIncrement;
  final VoidCallback onVentsDecrement;
  final VoidCallback onHashDecrement;

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = getTextTheme(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          context.tr('offers'),
        ),
        Row(
          children: [
            Flexible(
              child: _buildComponent(
                context,
                textTheme,
                image: ImageAssets.vents,
                text: 'buyVentsToCoolSystem',
                onIncrement: onVentsIncrement,
                onDecrement: onVentsDecrement,
                value: vents,
              ),
            ),
            Flexible(
              child: _buildComponent(
                context,
                textTheme,
                image: ImageAssets.hash,
                text: 'buyHashToFreezeStreak',
                onIncrement: onHashIncrement,
                onDecrement: onHashDecrement,
                value: hash,
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildComponent(
    BuildContext context,
    TextTheme textTheme, {
    required String image,
    required String text,
    required VoidCallback onIncrement,
    required VoidCallback onDecrement,
    required int value,
  }) {
    return Column(
      children: [
        Row(
          children: [
            Image.asset(
              height: 60,
              width: 60,
              image,
            ),
            Flexible(
              child: Padding(
                padding: const EdgeInsetsDirectional.only(bottom: 18.0),
                child: Text(
                  context.tr(text),
                  style: textTheme.bodyMedium?.copyWith(
                    fontSize: 12,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ),
          ],
        ),
        BalanceSwitcher(
          value: value,
          onIncrement: onIncrement,
          onDecrement: onDecrement,
        ),
      ],
    );
  }
}
