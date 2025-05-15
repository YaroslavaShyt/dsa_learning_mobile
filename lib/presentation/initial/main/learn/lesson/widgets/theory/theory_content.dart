import 'package:dsa_learning/core/utils/parsers/text_parser.dart';
import 'package:dsa_learning/core/utils/theme/app_color_theme.dart';
import 'package:dsa_learning/core/utils/theme/text_theme.dart';
import 'package:dsa_learning/presentation/initial/main/learn/lesson/widgets/theory/visualization_widget.dart';
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
      color: colorScheme.onInverseSurface.withValues(alpha: 0, green: 0),
      content: Stack(
        children: [
          MainScrollbar(
            controller: controller,
            child: SingleChildScrollView(
              controller: controller,
              child: Padding(
                padding: const EdgeInsetsDirectional.only(end: 8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  spacing: 16,
                  children: [
                    ...content.split('\n\n').map(
                          (paragraph) => MainContainer(
                            width: double.infinity,
                            borderRadius: 14,
                            color: colorScheme.onInverseSurface
                                .withValues(alpha: 0.8, green: 0.5),
                            padding: const EdgeInsetsDirectional.all(20),
                            content: RichText(
                              textAlign: TextAlign.justify,
                              strutStyle: const StrutStyle(
                                fontFamily: 'Nunito',
                              ),
                              text: TextSpan(
                                children: TextParser.parseCustomFormattedText(
                                  paragraph,
                                  textTheme,
                                ),
                                style: textTheme.labelMedium
                                    ?.copyWith(fontSize: 18),
                              ),
                            ),
                          ),
                        ),
                    if (image.isNotEmpty) VisualizationWidget(image: image),
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
