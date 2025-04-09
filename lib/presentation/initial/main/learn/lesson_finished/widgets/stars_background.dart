import 'package:dsa_learning/presentation/widgets/lottie_animations/star_animation.dart';
import 'package:flutter/material.dart';

class StarsBackground extends StatelessWidget {
  const StarsBackground({
    this.isLogin = false,
    super.key,
  });

  final bool isLogin;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          top: 10,
          left: 10,
          child: StarAnimation(isLogin: isLogin),
        ),
        Positioned(
          top: 200,
          left: 150,
          child: SizedBox(
            height: 50,
            width: 50,
            child: StarAnimation(isLogin: isLogin),
          ),
        ),
        Positioned(
          bottom: 100,
          right: 20,
          child: SizedBox(
            height: 50,
            width: 50,
            child: StarAnimation(isLogin: isLogin),
          ),
        ),
        Positioned(
          bottom: 110,
          left: 20,
          child: SizedBox(
              height: 50, width: 50, child: StarAnimation(isLogin: isLogin)),
        ),
        Positioned(
          bottom: 200,
          right: 100,
          child: SizedBox(
              height: 50, width: 50, child: StarAnimation(isLogin: isLogin)),
        ),
        Positioned(
          top: 100,
          right: 20,
          child: SizedBox(
            height: 50,
            width: 50,
            child: StarAnimation(isLogin: isLogin),
          ),
        ),
        Positioned(
          top: 270,
          left: 20,
          child: SizedBox(
              height: 50, width: 50, child: StarAnimation(isLogin: isLogin)),
        ),
        Positioned(
          bottom: 300,
          left: 60,
          child: SizedBox(
              height: 50, width: 50, child: StarAnimation(isLogin: isLogin)),
        ),
        Positioned(
          bottom: 400,
          left: MediaQuery.sizeOf(context).width / 2,
          child: SizedBox(
              height: 50, width: 50, child: StarAnimation(isLogin: isLogin)),
        ),
        Positioned(
          top: 300,
          right: 60,
          child: SizedBox(
              height: 50, width: 50, child: StarAnimation(isLogin: isLogin)),
        ),
      ],
    );
  }
}
