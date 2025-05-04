import 'package:dsa_learning/core/utils/theme/app_color_theme.dart';
import 'package:dsa_learning/domain/services/handlers/itutorial_handler.dart';
import 'package:dsa_learning/presentation/initial/main/onboarding/onboarding_screen.dart';
import 'package:dsa_learning/presentation/initial/main/onboarding/onboarding_start_or_end_screen.dart';
import 'package:dsa_learning/presentation/initial/main/onboarding/onboarding_steps.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:tutorial_coach_mark/tutorial_coach_mark.dart';

class TutorialHandler implements ITutorialHandler {
  TutorialCoachMark? tutorialCoachMark;

  @override
  void startTutorial(
    BuildContext context, {
    required void Function(int) onTabChanged,
    required VoidCallback? onTutorialStart,
    required VoidCallback onTutorialFinish,
  }) {
    onTutorialStart?.call();
    final ColorScheme colorScheme = getColorScheme(context);

    tutorialCoachMark = TutorialCoachMark(
      showSkipInLastTarget: false,
      targets: _buildTargets(onTabChanged),
      pulseAnimationDuration: const Duration(seconds: 2),
      colorShadow: colorScheme.onSecondary.withValues(alpha: 0.6),
      textSkip: context.tr('finish'),
      onClickTarget: (target) {
        if (target.keyTarget == learnTabKey) {
          onTabChanged(1);
          return;
        }
        if (target.keyTarget == profileTabKey) {
          onTabChanged(2);
          return;
        }
      },
      onFinish: onTutorialFinish,
      onSkip: () {
        onTutorialFinish();
        return true;
      },
    )..show(context: context);
  }

  Future<void> _onStartButtonPressed(
    void Function(int) onTabChanged,
  ) async {
    tutorialCoachMark?.next();
    final GlobalKey? key =
        tutorialCoachMark?.widgetKey.currentState?.currentTarget?.keyTarget;

    if (key == learnTabKey) {
      onTabChanged(1);
      return;
    }
    if (key == profileTabKey) {
      onTabChanged(2);
      return;
    }
    if (key == settingsMenuKey) {
      await Future.delayed(
        const Duration(seconds: 1),
        () => onTabChanged(0),
      );
      return;
    }
  }

  List<TargetFocus> _buildTargets(
    void Function(int) onTabChanged,
  ) {
    return [
      TargetFocus(
        keyTarget: startKey,
        enableTargetTab: false,
        contents: [
          TargetContent(
            align: ContentAlign.custom,
            customPosition: CustomTargetContentPosition(bottom: 100),
            child: OnboardingStartOrEndScreen(
              title: 'tutorialStart',
              onNextButtonPressed: () => _onStartButtonPressed(onTabChanged),
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
            child: OnboardingScreen(
              currentStep: 1,
              totalSteps: 3,
              title: 'tutorialStep1',
              onNextButtonPressed: () => _onStartButtonPressed(onTabChanged),
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
            child: OnboardingScreen(
              currentStep: 1,
              totalSteps: 3,
              description: 'tutorialStep1Description',
              onNextButtonPressed: () => _onStartButtonPressed(onTabChanged),
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
            child: OnboardingScreen(
              currentStep: 2,
              totalSteps: 3,
              title: 'tutorialStep2',
              onNextButtonPressed: () => _onStartButtonPressed(onTabChanged),
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
            child: OnboardingScreen(
              currentStep: 2,
              totalSteps: 3,
              description: 'tutorialStep2Description',
              onNextButtonPressed: () => _onStartButtonPressed(onTabChanged),
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
            child: OnboardingScreen(
              currentStep: 3,
              totalSteps: 3,
              title: 'tutorialStep3',
              onNextButtonPressed: () => _onStartButtonPressed(onTabChanged),
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
            child: OnboardingScreen(
              currentStep: 3,
              totalSteps: 3,
              description: 'tutorialStep3Description',
              onNextButtonPressed: () => _onStartButtonPressed(onTabChanged),
            ),
          ),
        ],
      ),
      TargetFocus(
        keyTarget: startKey,
        enableTargetTab: false,
        contents: [
          TargetContent(
            align: ContentAlign.bottom,
            child: OnboardingStartOrEndScreen(
              isFinish: true,
              title: 'tutorialFinish',
              onNextButtonPressed: () => _onStartButtonPressed(onTabChanged),
            ),
          ),
        ],
      ),
    ];
  }
}
