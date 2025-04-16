import 'package:dsa_learning/core/utils/theme/app_color_theme.dart';
import 'package:dsa_learning/core/utils/theme/text_theme.dart';
import 'package:dsa_learning/presentation/widgets/main_container.dart';
import 'package:dsa_learning/presentation/widgets/scroll/main_scroll_bar.dart';
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
      padding: const EdgeInsetsDirectional.only(
        start: 20,
        top: 20,
        end: 4,
        bottom: 20,
      ),
      content: Stack(
        children: [
          MainScrollbar(
            child: SingleChildScrollView(
              controller: controller,
              child: Padding(
                padding: const EdgeInsetsDirectional.only(end: 8),
                child: Column(
                  children: [
                    Text(
                      content,
                      textWidthBasis: TextWidthBasis.longestLine,
                      style: textTheme.labelMedium?.copyWith(
                        fontSize: 18,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
