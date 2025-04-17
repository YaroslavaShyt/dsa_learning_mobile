import 'package:dsa_learning/presentation/initial/main/onboarding/onboarding_screen.dart';
import 'package:flutter/widgets.dart';

class OnboardingArgs {
  OnboardingArgs({
    required this.title,
    required this.description,
  });

  final String title;
  final String description;
}

class OnboardingFactory {
  static Widget build(OnboardingArgs args) {
    return OnboardingScreen(
      title: args.title,
      description: args.description,
    );
  }
}
