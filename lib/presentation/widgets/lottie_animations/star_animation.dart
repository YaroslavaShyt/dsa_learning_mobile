import 'package:dsa_learning/core/constants/animation_assets.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class StarAnimation extends StatelessWidget {
  const StarAnimation({
    this.width = 50,
    this.height = 50,
    super.key,
  });

  final double height;
  final double width;

  @override
  Widget build(BuildContext context) {
    return LottieBuilder.asset(
      fit: BoxFit.fill,
      LottieAssets.star,
      height: height,
      width: width,
    );
  }
}
