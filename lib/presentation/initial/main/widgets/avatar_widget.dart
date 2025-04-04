import 'package:dsa_learning/core/constants/animation_assets.dart';
import 'package:dsa_learning/core/utils/theme/app_color_theme.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class AvatarWidget extends StatelessWidget {
  const AvatarWidget({
    required this.size,
    required this.avatarPath,
    super.key,
  });

  final double size;
  final String avatarPath;

  @override
  Widget build(BuildContext context) {
    final ColorScheme colorScheme = getColorScheme(context);
    return Container(
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(
          width: 2,
          color: colorScheme.onSurface.withValues(alpha: 0.4),
        ),
      ),
      child: ClipOval(
        child: LottieBuilder.asset(
          height: size,
          width: size,
          LottieAssets.avatar1,
        ),
      ),
    );
  }
}
