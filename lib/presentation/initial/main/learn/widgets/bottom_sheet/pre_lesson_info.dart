import 'package:dsa_learning/presentation/initial/main/learn/widgets/bottom_sheet/close_button.dart';
import 'package:dsa_learning/presentation/initial/main/learn/widgets/bottom_sheet/plan_container.dart';
import 'package:dsa_learning/presentation/initial/main/learn/widgets/bottom_sheet/start_button.dart';
import 'package:dsa_learning/presentation/initial/main/learn/widgets/bottom_sheet/title_container.dart';
import 'package:dsa_learning/presentation/widgets/lottie_animations/robot_animation.dart';
import 'package:flutter/material.dart';

class PreLessonInfo extends StatelessWidget {
  const PreLessonInfo({
    required this.onCloseIconTap,
    this.categoryName = 'Алгоритми сортування',
    this.lessonName = 'Урок 1: Вступ',
    this.planStep1 =
        'Огляд алгоритмів сортування та їх важливість в програмуванні.',
    this.planStep2 = 'Визначення поняття "сортування" та основні терміни.',
    this.planStep3 = 'Класифікація алгоритмів сортування.',
    this.planStep4 =
        'Оцінка складності алгоритмів сортування (O(n), O(n^2) тощо)',
    this.onStartTap,
    super.key,
  });

  final VoidCallback onCloseIconTap;
  final String categoryName;
  final String lessonName;
  final String planStep1;
  final String planStep2;
  final String planStep3;
  final String planStep4;
  final VoidCallback? onStartTap;

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
          lessonName: lessonName,
        ),
        PlanContainer(
          planStep1: planStep1,
          planStep2: planStep2,
          planStep3: planStep3,
          planStep4: planStep4,
        ),
        const Positioned(
          left: -30,
          bottom: -20,
          child: RobotAnimation(
            height: 200,
            width: 200,
          ),
        ),
        StartButton(
          onStartTap: onStartTap,
        ),
      ],
    );
  }
}
