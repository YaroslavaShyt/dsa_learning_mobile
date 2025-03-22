import 'package:dsa_learning/core/navigation/inavigation_util.dart';
import 'package:dsa_learning/data/services/user/user_service.dart';
import 'package:dsa_learning/data/services/user/user_state.dart';
import 'package:dsa_learning/domain/services/achievements/iachievements_service.dart';
import 'package:dsa_learning/main.dart';
import 'package:dsa_learning/presentation/initial/main/home/bloc/home_cubit.dart';
import 'package:dsa_learning/presentation/initial/main/home/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeFactory {
  static Widget build() {
    return BlocProvider<HomeCubit>(
      create: (BuildContext context) => HomeCubit(
          achievementsService: sl.get<IAchievementsService>(),
          userService: BlocProvider.of<UserService>(context),
          navigationUtil: sl.get<INavigationUtil>())
        ..init(),
      child: BlocListener<UserService, UserState>(
        listenWhen: _listedWhenUser,
        listener: (BuildContext context, UserState state) {
          BlocProvider.of<HomeCubit>(context).onUserDataChanged();
        },
        child: Builder(
          builder: (BuildContext context) {
            return HomeScreen(
              cubit: BlocProvider.of<HomeCubit>(context),
            );
          },
        ),
      ),
    );
  }

  static bool _listedWhenUser(UserState prev, UserState curr) {
    return prev.user?.profilePhoto != curr.user?.profilePhoto;
  }
}
