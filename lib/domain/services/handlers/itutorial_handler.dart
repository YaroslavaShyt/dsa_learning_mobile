import 'package:flutter/cupertino.dart';

abstract interface class ITutorialHandler {
  void startTutorial(
    BuildContext context, {
    required void Function(int) onTabChanged,
    required VoidCallback? onTutorialStart,
    required VoidCallback onTutorialFinish,
  });
}
