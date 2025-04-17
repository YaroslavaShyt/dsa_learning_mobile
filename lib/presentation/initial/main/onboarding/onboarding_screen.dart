import 'package:app_tutorial/app_tutorial.dart';
import 'package:flutter/material.dart';

List<TutorialItem> items = [
  TutorialItem(
    globalKey: homeTabKey,
    color: Colors.black.withValues(alpha: 0.6),
    borderRadius: const Radius.circular(15.0),
    shapeFocus: ShapeFocus.roundedSquare,
    child: const OnboardingScreen(
      title: 'This is a kek',
      description: 'Kekekekekekek',
    ),
  ),
];

final GlobalKey homeTabKey = GlobalKey();
final GlobalKey avatarKey = GlobalKey();
final GlobalKey textKey = GlobalKey();

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({
    required this.title,
    required this.description,
    super.key,
  });

  final String title;
  final String description;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    return Center(
      child: SizedBox(
        height: MediaQuery.of(context).size.height * 0.6,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: width * 0.1),
          child: Column(
            children: [
              Text(
                title,
                style: const TextStyle(color: Colors.white),
              ),
              const SizedBox(height: 10.0),
              Text(
                description,
                textAlign: TextAlign.center,
                style: const TextStyle(color: Colors.white),
              ),
              const Spacer(),
              Row(
                children: [
                  TextButton(
                    onPressed: () => Tutorial.skipAll(context),
                    child: const Text(
                      'Skip onboarding',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  const Spacer(),
                  const TextButton(
                    onPressed: null,
                    child: Text(
                      'Next',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
