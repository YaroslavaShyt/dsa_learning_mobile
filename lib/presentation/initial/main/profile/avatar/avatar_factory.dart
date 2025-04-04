import 'package:dsa_learning/core/navigation/inavigation_util.dart';
import 'package:dsa_learning/data/services/rewards/rewards_service.dart';
import 'package:dsa_learning/data/services/user/user_service.dart';
import 'package:dsa_learning/main.dart';
import 'package:dsa_learning/presentation/initial/main/profile/avatar/avatar_screen.dart';
import 'package:dsa_learning/presentation/initial/main/profile/avatar/bloc/avatar_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AvatarFactory {
  static Widget build() {
    return BlocProvider<AvatarCubit>(
      create: (BuildContext context) => AvatarCubit(
        navigationUtil: sl.get<INavigationUtil>(),
        rewardsService: BlocProvider.of<RewardsService>(context),
        userService: BlocProvider.of<UserService>(context),
      )..init(),
      child: Builder(
        builder: (context) {
          return AvatarScreen(
            cubit: BlocProvider.of<AvatarCubit>(context),
          );
        },
      ),
    );
  }
}
