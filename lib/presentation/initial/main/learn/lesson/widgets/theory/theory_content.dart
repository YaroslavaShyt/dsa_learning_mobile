import 'package:dsa_learning/core/utils/theme/app_color_theme.dart';
import 'package:dsa_learning/core/utils/theme/text_theme.dart';
import 'package:dsa_learning/presentation/widgets/main_container.dart';
import 'package:dsa_learning/presentation/widgets/scroll/main_scroll_bar.dart';
import 'package:flutter/material.dart';

class TheoryContent extends StatelessWidget {
  const TheoryContent({
    required this.content,
    required this.controller,
    required this.image,
    super.key,
  });

  final String content;
  final String image;
  final ScrollController controller;

  @override
  Widget build(BuildContext context) {
    final ColorScheme colorScheme = getColorScheme(context);
    final TextTheme textTheme = getTextTheme(context);

    return MainContainer(
      height: 500,
      width: double.infinity,
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
                  crossAxisAlignment: CrossAxisAlignment.start,
                  spacing: 10,
                  children: [
                    Text(
                      content,
                      textAlign: TextAlign.justify,
                      style: textTheme.labelMedium?.copyWith(
                        fontSize: 18,
                      ),
                    ),
                    if (image.isNotEmpty) ...[
                      Align(
                        alignment: Alignment.center,
                        child: ClipRect(
                          child: Container(
                            height: 300,
                            width: double.infinity,
                            decoration: BoxDecoration(
                              border: Border.all(
                                width: 2,
                                color: colorScheme.onSurface
                                    .withValues(alpha: 0.6),
                              ),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Image.network(
                              image,
                              height: 300,
                              frameBuilder: (context, child, frame,
                                  wasSynchronouslyLoaded) {
                                if (frame == null) {
                                  return Center(
                                    child: CircularProgressIndicator(
                                      color: colorScheme.onSurface
                                          .withValues(alpha: 0.6),
                                    ),
                                  );
                                }
                                return child;
                              },
                              errorBuilder: (context, error, stackTrace) {
                                return Icon(
                                  Icons.error,
                                  color: colorScheme.onSurface
                                      .withValues(alpha: 0.6),
                                );
                              },
                            ),
                          ),
                        ),
                      ),
                    ]
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
