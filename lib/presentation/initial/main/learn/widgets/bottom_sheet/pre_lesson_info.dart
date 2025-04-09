import 'package:dsa_learning/core/constants/animation_assets.dart';
import 'package:dsa_learning/domain/lesson/ilesson.dart';
import 'package:dsa_learning/presentation/initial/main/learn/widgets/bottom_sheet/close_button.dart';
import 'package:dsa_learning/presentation/initial/main/learn/widgets/bottom_sheet/plan_container.dart';
import 'package:dsa_learning/presentation/initial/main/learn/widgets/bottom_sheet/start_button.dart';
import 'package:dsa_learning/presentation/initial/main/learn/widgets/bottom_sheet/title_container.dart';
import 'package:dsa_learning/presentation/widgets/lottie_animations/main_animation_widget.dart';
import 'package:flutter/material.dart';

class PreLessonInfo extends StatelessWidget {
  const PreLessonInfo({
    required this.lesson,
    required this.onCloseIconTap,
    required this.categoryName,
    this.onStartTap,
    super.key,
  });

  final VoidCallback onCloseIconTap;
  final String categoryName;
  final VoidCallback? onStartTap;
  final ILesson lesson;

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        AppCloseButton(
          onCloseButtonTap: onCloseIconTap,
        ),
        TitleContainer(
          categoryName: categoryName,
          lessonName: lesson.title,
        ),
        PlanContainer(
          planStep1: lesson.plan.step1,
          planStep2: lesson.plan.step2,
          planStep3: lesson.plan.step3,
          planStep4: lesson.plan.step4,
        ),
        const Positioned(
          left: -30,
          bottom: -20,
          child: MainAnimationWidget(
            height: 200,
            width: 200,
            name: LottieAssets.welcomeRobot,
          ),
        ),
        StartButton(
          onStartTap: onStartTap,
        ),
      ],
    );
  }
}
