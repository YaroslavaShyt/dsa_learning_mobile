import 'package:dsa_learning/data/services/user/user_service.dart';
import 'package:dsa_learning/data/services/user/user_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';

class MainAnimationWidget extends StatelessWidget {
  const MainAnimationWidget({
    required this.name,
    required this.height,
    required this.width,
    super.key,
  });

  final double height;
  final double width;
  final String name;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserService, UserState>(
      buildWhen: (prev, curr) =>
          curr.user != null && prev.user!.animations != curr.user!.animations,
      builder: (context, state) {
        return LottieBuilder.asset(
          height: height,
          width: width,
          animate: state.user!.animations,
          name,
        );
      },
    );
  }
}
