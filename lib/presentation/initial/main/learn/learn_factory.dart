import 'package:dsa_learning/core/navigation/inavigation_util.dart';
import 'package:dsa_learning/data/services/rewards/rewards_service.dart';
import 'package:dsa_learning/data/services/user/user_service.dart';
import 'package:dsa_learning/data/services/user/user_state.dart';
import 'package:dsa_learning/domain/handlers/iaudio_handler.dart';
import 'package:dsa_learning/domain/lesson/ilesson_repository.dart';
import 'package:dsa_learning/domain/services/lesson/ilesson_service.dart';
import 'package:dsa_learning/main.dart';
import 'package:dsa_learning/presentation/initial/main/learn/bloc/learn_cubit.dart';
import 'package:dsa_learning/presentation/initial/main/learn/learn_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LearnFactory {
  static Widget build() {
    return BlocProvider<LearnCubit>(
      create: (context) => LearnCubit(
        audioHandler: sl.get<IAudioHandler>(),
        navigationUtil: sl.get<INavigationUtil>(),
        lessonRepository: sl.get<ILessonRepository>(),
        lessonService: sl.get<ILessonService>(),
        isSoundOn: BlocProvider.of<UserService>(context).user!.sounds,
        rewardsService: BlocProvider.of<RewardsService>(context),
      )..init(),
      child: BlocListener<UserService, UserState>(
        listener: (BuildContext context, UserState state) {
          BlocProvider.of<LearnCubit>(context)
              .updateSoundSettings(state.user!.sounds);
        },
        child: Builder(
          builder: (BuildContext context) {
            return LearnScreen(
              cubit: BlocProvider.of<LearnCubit>(context),
            );
          },
        ),
      ),
    );
  }
}
