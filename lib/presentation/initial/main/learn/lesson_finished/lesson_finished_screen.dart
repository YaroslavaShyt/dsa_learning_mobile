import 'package:dsa_learning/core/utils/theme/app_color_theme.dart';
import 'package:dsa_learning/core/utils/theme/text_theme.dart';
import 'package:dsa_learning/presentation/initial/main/learn/lesson_finished/lesson_finished_factory.dart';
import 'package:dsa_learning/presentation/initial/main/learn/lesson_finished/widgets/achievements_row.dart';
import 'package:dsa_learning/presentation/initial/main/learn/lesson_finished/widgets/lesson_finished_container.dart';
import 'package:dsa_learning/presentation/initial/main/learn/lesson_finished/widgets/lesson_is_over_text.dart';
import 'package:dsa_learning/presentation/initial/main/learn/lesson_finished/widgets/reward_row.dart';
import 'package:dsa_learning/presentation/initial/main/learn/lesson_finished/widgets/stars_background.dart';
import 'package:dsa_learning/presentation/widgets/buttons/main_outlined_button.dart';
import 'package:dsa_learning/presentation/widgets/lottie_animations/robot_animation.dart';
import 'package:dsa_learning/presentation/widgets/main_background.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class LessonFinishedScreen extends StatelessWidget {
  const LessonFinishedScreen({
    required this.args,
    super.key,
  });

  final LessonFinishedRoutingArgs args;

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = getTextTheme(context);
    final ColorScheme colorScheme = getColorScheme(context);

    return Scaffold(
      body: SafeArea(
        child: Stack(
          fit: StackFit.loose,
          children: [
            const MainBackground(),
            const StarsBackground(),
            const Positioned(
              top: 100,
              left: 50,
              right: 50,
              child: SizedBox(
                height: 400,
                width: 450,
                child: RobotAnimation(),
              ),
            ),
            Positioned(
              top: 10,
              left: 20,
              right: 20,
              child: LessonFinishedContainer(
                time: args.time,
                lessonName: args.lessonName,
                lessonDescription: args.lessonDescription,
                isGame: args.isGame,
              ),
            ),
            Positioned(
              left: 20,
              right: 20,
              bottom: MediaQuery.sizeOf(context).height / 4,
              child: const LessonIsOverText(),
            ),
            Positioned(
              left: 20,
              right: 20,
              bottom: MediaQuery.sizeOf(context).height / 2.5 - 100,
              child: RewardRow(
                fan: args.fan,
                hash: args.hash,
                bytes: args.bytes,
              ),
            ),
            Positioned(
              left: 20,
              right: 20,
              bottom: MediaQuery.sizeOf(context).height / 2.5 - 240,
              child: AchievementsRow(
                achievements: args.achievements,
              ),
            ),
            Positioned(
              bottom: 10,
              left: 20,
              right: 20,
              child: MainOutlinedButton(
                onPressed: args.onToLessonsPressed,
                child: Text(
                  context.tr("toLessons"),
                  style: textTheme.bodyMedium?.copyWith(
                    color: colorScheme.primaryFixed,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
