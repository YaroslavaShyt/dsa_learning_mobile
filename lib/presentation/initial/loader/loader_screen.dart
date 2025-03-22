import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:dsa_learning/core/utils/theme/text_theme.dart';
import 'package:dsa_learning/presentation/widgets/lottie_animations/robot_animation.dart';
import 'package:dsa_learning/presentation/widgets/main_background.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class LoaderScreen extends StatelessWidget {
  const LoaderScreen({
    this.loadingText,
    this.loadedText,
    required this.isLoadingInProgress,
    super.key,
  });

  final String? loadingText;
  final String? loadedText;
  final bool isLoadingInProgress;

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = getTextTheme(context);
    return Scaffold(
      body: Stack(
        children: [
          const MainBackground(),
          Positioned(
            top: 50,
            left: 10,
            right: 10,
            bottom: -50,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              mainAxisSize: MainAxisSize.min,
              children: [
                const SizedBox(
                  height: 400,
                  child: RobotAnimation(),
                ),
                if (isLoadingInProgress)
                  SizedBox(
                    height: 200,
                    child: AnimatedTextKit(
                      animatedTexts: [
                        TypewriterAnimatedText(
                          context.tr("loadingInformationBytes"),
                          textAlign: TextAlign.center,
                          textStyle: textTheme.titleLarge?.copyWith(
                            fontWeight: FontWeight.w700,
                          ),
                          speed: const Duration(milliseconds: 100),
                        ),
                      ],
                      repeatForever: true,
                      pause: const Duration(seconds: 3),
                    ),
                  )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
