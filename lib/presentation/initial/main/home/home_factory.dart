import 'package:dsa_learning/core/navigation/inavigation_util.dart';
import 'package:dsa_learning/data/services/achievements/achievemens_state.dart';
import 'package:dsa_learning/data/services/achievements/achievements_service.dart';
import 'package:dsa_learning/data/services/rewards/rewards_service.dart';
import 'package:dsa_learning/data/services/rewards/rewards_state.dart';
import 'package:dsa_learning/data/services/user/user_service.dart';
import 'package:dsa_learning/domain/handlers/iaudio_handler.dart';
import 'package:dsa_learning/domain/handlers/istreak_handler.dart';
import 'package:dsa_learning/main.dart';
import 'package:dsa_learning/presentation/initial/main/home/bloc/home_cubit.dart';
import 'package:dsa_learning/presentation/initial/main/home/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeFactory {
  static Widget build(VoidCallback onInitialized) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<HomeCubit>(
          create: (BuildContext context) => HomeCubit(
            onInitialized: onInitialized,
            audioHandler: sl.get<IAudioHandler>(),
            navigationUtil: sl.get<INavigationUtil>(),
            streakHandler: sl.get<IStreakHandler>(),
            userService: BlocProvider.of<UserService>(context),
            achievementsService: BlocProvider.of<AchievementsService>(context),
            rewardsService: BlocProvider.of<RewardsService>(context),
          ),
        ),
      ],
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
}
