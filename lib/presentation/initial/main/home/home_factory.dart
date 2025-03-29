import 'package:dsa_learning/core/navigation/inavigation_util.dart';
import 'package:dsa_learning/core/widgets/popup/popup_mixin.dart';
import 'package:dsa_learning/data/services/achievements/achievemens_state.dart';
import 'package:dsa_learning/data/services/achievements/achievements_service.dart';
import 'package:dsa_learning/data/services/rewards/rewards_service.dart';
import 'package:dsa_learning/data/services/rewards/rewards_state.dart';
import 'package:dsa_learning/data/services/user/user_service.dart';
import 'package:dsa_learning/data/services/user/user_state.dart';
import 'package:dsa_learning/main.dart';
import 'package:dsa_learning/presentation/initial/main/home/bloc/home_cubit.dart';
import 'package:dsa_learning/presentation/initial/main/home/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeFactory with PopUpMixin {
  static Widget build() {
    return BlocProvider<HomeCubit>(
      create: (BuildContext context) => HomeCubit(
        navigationUtil: sl.get<INavigationUtil>(),
        userService: BlocProvider.of<UserService>(context),
        achievementsService: BlocProvider.of<AchievementsService>(context),
        rewardsService: BlocProvider.of<RewardsService>(context),
      ),
      child: MultiBlocListener(
        listeners: [
          BlocListener<AchievementsService, AchievementsState>(
            listener: (BuildContext context, AchievementsState state) {
              BlocProvider.of<HomeCubit>(context).onAchievementsChanged();
            },
          ),
          BlocListener<RewardsService, RewardsState>(
            listener: (BuildContext context, RewardsState state) {
              BlocProvider.of<HomeCubit>(context).onRewardsChanged();
            },
          ),
          BlocListener<UserService, UserState>(
            listenWhen: _listedWhenUser,
            listener: (BuildContext context, UserState state) {
              BlocProvider.of<HomeCubit>(context).onUserDataChanged();
            },
          ),
        ],
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
