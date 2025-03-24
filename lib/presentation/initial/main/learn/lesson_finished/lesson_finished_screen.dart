import 'package:dsa_learning/core/utils/theme/app_color_theme.dart';
import 'package:dsa_learning/core/utils/theme/text_theme.dart';
import 'package:dsa_learning/presentation/initial/main/learn/lesson_finished/widgets/stars_background.dart';
import 'package:dsa_learning/presentation/widgets/lottie_animations/robot_animation.dart';
import 'package:dsa_learning/presentation/widgets/main_background.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class LessonFinishedScreen extends StatelessWidget {
  const LessonFinishedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = getTextTheme(context);

    return Scaffold(
      body: Stack(
        children: [
          const MainBackground(),
          // const StarsBackground(),
          const SizedBox(
            height: 570,
            child: RobotAnimation(),
          ),
          Positioned(
            left: 10,
            right: 10,
            bottom: 100,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      context.tr('lessonIsOver'),
                      style: textTheme.titleLarge?.copyWith(
                        color: getColorScheme(context).onSurface,
                        fontSize: 30,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ],
                ),
                Text(
                  context.tr('reward'),
                  style: textTheme.titleLarge?.copyWith(
                    color: getColorScheme(context).onSurface,
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                Text(
                  context.tr('achievements'),
                  style: textTheme.titleLarge?.copyWith(
                    color: getColorScheme(context).onSurface,
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
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
