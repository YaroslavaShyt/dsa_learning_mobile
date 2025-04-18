import 'package:dsa_learning/core/utils/theme/app_color_theme.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:tutorial_coach_mark/tutorial_coach_mark.dart';

final GlobalKey homeTabKey = GlobalKey();
final GlobalKey homeContentKey = GlobalKey();
final GlobalKey learnTabKey = GlobalKey();
final GlobalKey lessonCategoryKey = GlobalKey();
final GlobalKey profileTabKey = GlobalKey();
final GlobalKey settingsMenuKey = GlobalKey();

List<TargetFocus> targets = [
  TargetFocus(
    keyTarget: homeTabKey,
    contents: [
      TargetContent(
        align: ContentAlign.custom,
        customPosition: CustomTargetContentPosition(bottom: 100),
        child: const OnboardingScreen(
          currentStep: 1,
          totalSteps: 3,
          title: 'tutorialStep1',
        ),
      ),
    ],
  ),
  TargetFocus(
    keyTarget: homeContentKey,
    shape: ShapeLightFocus.RRect,
    contents: [
      TargetContent(
        align: ContentAlign.custom,
        customPosition: CustomTargetContentPosition(bottom: 100),
        child: const OnboardingScreen(
          currentStep: 1,
          totalSteps: 3,
          title: 'tutorialStep1',
          description: 'tutorialStep1Description',
        ),
      ),
    ],
  ),
  TargetFocus(
    keyTarget: learnTabKey,
    contents: [
      TargetContent(
        align: ContentAlign.custom,
        customPosition: CustomTargetContentPosition(bottom: 100),
        child: const OnboardingScreen(
          currentStep: 2,
          totalSteps: 3,
          title: 'tutorialStep2',
        ),
      ),
    ],
  ),
  TargetFocus(
    keyTarget: lessonCategoryKey,
    shape: ShapeLightFocus.RRect,
    contents: [
      TargetContent(
        align: ContentAlign.custom,
        customPosition: CustomTargetContentPosition(bottom: 100),
        child: const OnboardingScreen(
          currentStep: 2,
          totalSteps: 3,
          title: 'tutorialStep2',
          description: 'tutorialStep2Description',
        ),
      ),
    ],
  ),
  TargetFocus(
    keyTarget: profileTabKey,
    contents: [
      TargetContent(
        align: ContentAlign.custom,
        customPosition: CustomTargetContentPosition(bottom: 100),
        child: const OnboardingScreen(
          currentStep: 3,
          totalSteps: 3,
          title: 'tutorialStep3',
        ),
      ),
    ],
  ),
  TargetFocus(
    keyTarget: settingsMenuKey,
    shape: ShapeLightFocus.RRect,
    contents: [
      TargetContent(
        align: ContentAlign.custom,
        customPosition: CustomTargetContentPosition(bottom: 100),
        child: const OnboardingScreen(
          currentStep: 3,
          totalSteps: 3,
          title: 'tutorialStep3',
          description: 'tutorialStep3Description',
        ),
      ),
    ],
  ),
];

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({
    required this.title,
    required this.currentStep,
    required this.totalSteps,
    this.description,
    super.key,
  });

  final int currentStep;
  final int totalSteps;
  final String title;
  final String? description;

  @override
  Widget build(BuildContext context) {
    final ColorScheme colorScheme = getColorScheme(context);
    final double width = MediaQuery.of(context).size.width;

    return Center(
      child: Container(
        padding: EdgeInsetsDirectional.symmetric(
          horizontal: width * 0.1,
          vertical: 10,
        ),
        decoration: BoxDecoration(
          border: Border.all(
            color: colorScheme.onInverseSurface,
            width: 2,
          ),
          borderRadius: BorderRadius.circular(20),
          color: colorScheme.surface,
        ),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "$currentStep/$totalSteps",
                  style: const TextStyle(color: Colors.white),
                ),
                Flexible(
                  child: Text(
                    context.tr(title),
                    textAlign: TextAlign.center,
                    style: const TextStyle(color: Colors.white),
                  ),
                ),
                const SizedBox(width: 20),
              ],
            ),
            const SizedBox(height: 10.0),
            if (description != null)
              Text(
                context.tr(description!),
                textAlign: TextAlign.center,
                style: const TextStyle(color: Colors.white),
              ),
          ],
        ),
      ),
    );
  }
}
