import 'package:dsa_learning/core/navigation/inavigation_util.dart';
import 'package:dsa_learning/data/services/achievements/achievements_service.dart';
import 'package:dsa_learning/data/services/rewards/rewards_service.dart';
import 'package:dsa_learning/data/services/user/user_service.dart';
import 'package:dsa_learning/domain/lesson/ilesson_repository.dart';
import 'package:dsa_learning/domain/services/handlers/sounds/ivibration_handler.dart';
import 'package:dsa_learning/domain/services/lesson/ilesson_service.dart';
import 'package:dsa_learning/main.dart';
import 'package:dsa_learning/presentation/initial/main/home/widgets/statistics/bloc/statistics_cubit.dart';
import 'package:dsa_learning/presentation/initial/main/learn/lesson/bloc/lesson_cubit.dart';
import 'package:dsa_learning/presentation/initial/main/learn/lesson/lesson_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LessonRoutingArgs {
  LessonRoutingArgs({
    required this.id,
    required this.gameId,
    required this.category,
  });

  final int id;
  final int gameId;
  final String category;
}

class LessonFactory {
  static Widget build(LessonRoutingArgs args) {
    return BlocProvider(
      create: (BuildContext context) => LessonCubit(
        lessonId: args.id,
        gameId: args.gameId,
        lessonService: sl.get<ILessonService>(),
        navigationUtil: sl.get<INavigationUtil>(),
        lessonRepository: sl.get<ILessonRepository>(),
        rewardsService: BlocProvider.of<RewardsService>(context),
        achievementsService: BlocProvider.of<AchievementsService>(context),
        vibrationHandler: sl.get<IVibrationHandler>(),
        statisticsCubit: BlocProvider.of<StatisticsCubit>(context),
        isVibrationEnabled:
            BlocProvider.of<UserService>(context).user!.vibration,
        categoryName: args.category,
      )..init(),
      child: Builder(
        builder: (BuildContext context) {
          return LessonScreen(
            cubit: BlocProvider.of<LessonCubit>(context),
          );
        },
      ),
    );
  }
}
