import 'package:dsa_learning/presentation/initial/main/onboarding/onboarding_screen.dart';
import 'package:dsa_learning/presentation/initial/main/onboarding/onboarding_start_or_end_screen.dart';
import 'package:flutter/material.dart';
import 'package:tutorial_coach_mark/tutorial_coach_mark.dart';

final GlobalKey startKey = GlobalKey();
final GlobalKey homeTabKey = GlobalKey();
final GlobalKey homeContentKey = GlobalKey();
final GlobalKey learnTabKey = GlobalKey();
final GlobalKey lessonCategoryKey = GlobalKey();
final GlobalKey profileTabKey = GlobalKey();
final GlobalKey settingsMenuKey = GlobalKey();
final GlobalKey finishKey = GlobalKey();

List<TargetFocus> targets = [
  TargetFocus(
    keyTarget: startKey,
    enableTargetTab: false,
    contents: [
      TargetContent(
        align: ContentAlign.custom,
        customPosition: CustomTargetContentPosition(bottom: 100),
        child: const OnboardingStartOrEndScreen(
          title: 'tutorialStart',
        ),
      ),
    ],
  ),
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
  TargetFocus(
    keyTarget: finishKey,
    enableTargetTab: false,
    contents: [
      TargetContent(
        align: ContentAlign.bottom,
        child: const OnboardingStartOrEndScreen(
          title: 'tutorialFinish',
        ),
      ),
    ],
  ),
];
