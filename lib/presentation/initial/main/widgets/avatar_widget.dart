import 'dart:io';

import 'package:dsa_learning/core/utils/theme/app_color_theme.dart';
import 'package:dsa_learning/presentation/widgets/main_shadow.dart';
import 'package:flutter/material.dart';

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
    if (avatarPath.isEmpty) {
      return Container(
        height: size,
        width: size,
        decoration: BoxDecoration(
          border: Border.all(
            color: colorScheme.onSurface.withValues(alpha: 0.7),
          ),
          shape: BoxShape.circle,
        ),
        child: Icon(
          Icons.person_rounded,
          size: size / 2,
          color: colorScheme.onSurface.withValues(alpha: 0.7),
          shadows: [mainBoxShadow(context)],
        ),
      );
    }
    return Container(
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        boxShadow: [mainBoxShadow(context)],
      ),
      child: ClipOval(
        child: Image.file(
          height: size,
          width: size,
          File(
            avatarPath,
          ),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
