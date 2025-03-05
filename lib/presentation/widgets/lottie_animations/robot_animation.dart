import 'package:dsa_learning/core/constants/animation_assets.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class RobotAnimation extends StatelessWidget {
  const RobotAnimation({
    this.width = double.infinity,
    this.height = 100,
    super.key,
  });

  final double height;
  final double width;

  @override
  Widget build(BuildContext context) {
    return LottieBuilder.asset(
      LottieAssets.welcomeRobot,
      height: height,
      width: width,
    );
  }
}
