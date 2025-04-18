import 'package:dsa_learning/core/utils/theme/app_color_theme.dart';
import 'package:dsa_learning/presentation/initial/main/bloc/main_cubit.dart';
import 'package:dsa_learning/presentation/initial/main/bloc/main_state.dart';
import 'package:dsa_learning/presentation/initial/main/home/home_factory.dart';
import 'package:dsa_learning/presentation/initial/main/learn/learn_factory.dart';
import 'package:dsa_learning/presentation/initial/main/profile/profile_factory.dart';
import 'package:dsa_learning/presentation/widgets/main_shadow.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tutorial_coach_mark/tutorial_coach_mark.dart';

import 'onboarding/onboarding_screen.dart';

part 'widgets/button_component.dart';
part 'widgets/main_floating_action_button.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({
    required this.cubit,
    super.key,
  });

  final MainCubit cubit;

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  TutorialCoachMark? tutorialCoachMark;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<MainCubit, MainState>(
      listener: (_, MainState state) {
        if (state.isReadyForOnboarding && !state.isTutorialStarted) {
          _startTutorial(context);
        }
      },
      builder: (_, MainState state) {
        return Scaffold(
          body: Stack(
            children: [
              IndexedStack(
                index: state.selectedIndex,
                children: [
                  HomeFactory.build(
                    () => widget.cubit.onTabsInitialized(isHomeLoaded: true),
                  ),
                  LearnFactory.build(
                    () => widget.cubit.onTabsInitialized(isLearnLoaded: true),
                  ),
                  ProfileFactory.build(
                    () => widget.cubit.onTabsInitialized(isProfileLoaded: true),
                  ),
                ],
              ),
              Positioned(
                left: 100,
                right: 100,
                bottom: 30,
                child: _MainFloatingActionButton(
                  onChanged: widget.cubit.onTabChanged,
                  selectedIndex: state.selectedIndex,
                  onHomeTapped: () => widget.cubit.onTabChanged(0),
                  onLearnTapped: () => widget.cubit.onTabChanged(1),
                  onProfileTapped: () => widget.cubit.onTabChanged(2),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  // @override
  // void didUpdateWidget(covariant MainScreen oldWidget) {
  //   if (tutorialCoachMark != null) tutorialCoachMark!.finish();
  //   _startTutorial(context);
  //   super.didUpdateWidget(oldWidget);
  // }

  void _startTutorial(BuildContext context) {
    widget.cubit.startTutorial();
    final ColorScheme colorScheme = getColorScheme(context);

    tutorialCoachMark = TutorialCoachMark(
      pulseEnable: false,
      targets: targets,
      colorShadow: colorScheme.onSecondary.withValues(alpha: 0.6),
      textSkip: context.tr('skip'),
      // paddingFocus: 10,
      // opacityShadow: 0.8,
      onClickTarget: (target) {
        print(target.keyTarget == homeTabKey);
        if (target.keyTarget == learnTabKey) {
          widget.cubit.onTabChanged(1);
          return;
        }
        if (target.keyTarget == profileTabKey) {
          widget.cubit.onTabChanged(2);
          return;
        }
        // print(target);
      },
      onClickTargetWithTapPosition: (target, tapDetails) {
        print("target: $target");
        print(
            "clicked at position local: ${tapDetails.localPosition} - global: ${tapDetails.globalPosition}");
      },
      onClickOverlay: (target) {
        print(target);
      },
      onSkip: () {
        print("skip");
        return true;
      },
      onFinish: () {
        print("finish");
      },
    )..show(context: context);
  }
}
