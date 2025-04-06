import 'package:dsa_learning/core/constants/animation_assets.dart';
import 'package:dsa_learning/core/utils/theme/app_color_theme.dart';
import 'package:dsa_learning/core/utils/theme/text_theme.dart';
import 'package:dsa_learning/domain/services/handlers/sounds/ivibration_handler.dart';
import 'package:dsa_learning/main.dart';
import 'package:dsa_learning/presentation/initial/main/learn/lesson_finished/lesson_finished_factory.dart';
import 'package:dsa_learning/presentation/initial/main/learn/lesson_finished/widgets/achievements_row.dart';
import 'package:dsa_learning/presentation/initial/main/learn/lesson_finished/widgets/lesson_finished_container.dart';
import 'package:dsa_learning/presentation/initial/main/learn/lesson_finished/widgets/lesson_is_over_text.dart';
import 'package:dsa_learning/presentation/initial/main/learn/lesson_finished/widgets/reward_row.dart';
import 'package:dsa_learning/presentation/initial/main/learn/lesson_finished/widgets/stars_background.dart';
import 'package:dsa_learning/presentation/widgets/buttons/main_outlined_button.dart';
import 'package:dsa_learning/presentation/widgets/lottie_animations/main_animation_widget.dart';
import 'package:dsa_learning/presentation/widgets/main_background.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class LessonFinishedScreen extends StatefulWidget {
  const LessonFinishedScreen({
    required this.args,
    super.key,
  });

  final LessonFinishedRoutingArgs args;

  @override
  State<LessonFinishedScreen> createState() => _LessonFinishedScreenState();
}

class _LessonFinishedScreenState extends State<LessonFinishedScreen> {
  @override
  void initState() {
    super.initState();
    sl.get<IVibrationHandler>().vibrate(repeat: false);
  }

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
            Padding(
              padding: const EdgeInsetsDirectional.all(10.0),
              child: Column(
                spacing: 10,
                children: [
                  Flexible(
                    child: LessonFinishedContainer(
                      time: widget.args.time,
                      lessonName: widget.args.lessonName,
                      lessonDescription: widget.args.lessonDescription,
                      isGame: widget.args.isGame,
                    ),
                  ),
                  const MainAnimationWidget(
                    name: LottieAssets.welcomeRobot,
                    height: 350,
                    width: 350,
                  ),
                  const LessonIsOverText(),
                  RewardRow(
                    fan: widget.args.fan,
                    hash: widget.args.hash,
                    bytes: widget.args.bytes,
                  ),
                  AchievementsRow(
                    achievements: widget.args.achievements,
                  ),
                  Padding(
                    padding: const EdgeInsetsDirectional.symmetric(
                      horizontal: 20,
                      vertical: 10,
                    ),
                    child: MainOutlinedButton(
                      onPressed: widget.args.onToLessonsPressed,
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
          ],
        ),
      ),
    );
  }
}
