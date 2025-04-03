import 'package:dsa_learning/core/utils/theme/app_color_theme.dart';
import 'package:dsa_learning/core/utils/theme/text_theme.dart';
import 'package:dsa_learning/presentation/widgets/main_container.dart';
import 'package:flutter/material.dart';

class TheoryContent extends StatelessWidget {
  const TheoryContent({
    required this.content,
    required this.controller,
    super.key,
  });

  final String content;
  final ScrollController controller;

  @override
  Widget build(BuildContext context) {
    final ColorScheme colorScheme = getColorScheme(context);
    final TextTheme textTheme = getTextTheme(context);

    return MainContainer(
      height: 500,
      borderRadius: 14,
      color: colorScheme.onInverseSurface.withValues(alpha: 0.8, green: 0.5),
      padding: const EdgeInsetsDirectional.symmetric(
        horizontal: 20,
        vertical: 20,
      ),
      content: Stack(
        children: [
          SingleChildScrollView(
            controller: controller,
            child: Column(
              children: [
                Text(
                  content,
                  style: textTheme.labelMedium?.copyWith(
                    fontSize: 18,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
