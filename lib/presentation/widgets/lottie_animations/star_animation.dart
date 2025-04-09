import 'package:dsa_learning/core/constants/animation_assets.dart';
import 'package:dsa_learning/presentation/widgets/lottie_animations/main_animation_widget.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class StarAnimation extends StatelessWidget {
  const StarAnimation({
    this.isLogin = false,
    this.width = 50,
    this.height = 50,
    super.key,
  });

  final bool isLogin;
  final double height;
  final double width;

  @override
  Widget build(BuildContext context) {
    if (isLogin) {
      return LottieBuilder.asset(
        height: height,
        width: width,
        LottieAssets.star,
      );
    }
    return MainAnimationWidget(
      name: LottieAssets.star,
      height: height,
      width: width,
    );
  }
}
