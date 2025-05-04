import 'package:dsa_learning/data/services/user/user_service.dart';
import 'package:dsa_learning/data/services/user/user_state.dart';
import 'package:dsa_learning/domain/handlers/iaudio_handler.dart';
import 'package:dsa_learning/domain/services/handlers/itutorial_handler.dart';
import 'package:dsa_learning/main.dart';
import 'package:dsa_learning/presentation/initial/main/bloc/main_cubit.dart';
import 'package:dsa_learning/presentation/initial/main/bloc/main_state.dart';
import 'package:dsa_learning/presentation/initial/main/main_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'home/widgets/statistics/bloc/statistics_cubit.dart';

class MainFactory {
  static Widget build() {
    final ITutorialHandler tutorialHandler = sl.get<ITutorialHandler>();

    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (BuildContext context) => MainCubit(
            audioHandler: sl.get<IAudioHandler>(),
            userService: BlocProvider.of<UserService>(context),
            statisticsCubit: BlocProvider.of<StatisticsCubit>(context),
          )..init(),
        ),
      ],
      child: MultiBlocListener(
        listeners: [
          BlocListener<UserService, UserState>(
            listenWhen: (p, c) =>
                c.user != null && p.user!.sounds != c.user!.sounds,
            listener: (BuildContext context, UserState state) {
              BlocProvider.of<MainCubit>(context).updateSoundSettings(
                isSoundEnabled: state.user!.sounds,
              );
            },
          ),
          BlocListener<MainCubit, MainState>(
            listenWhen: _listenMainWhen,
            listener: (BuildContext context, MainState state) {
              if (BlocProvider.of<MainCubit>(context).shouldShowTutorial) {
                tutorialHandler.startTutorial(
                  context,
                  onTabChanged:
                      BlocProvider.of<MainCubit>(context).onTabChanged,
                  onTutorialStart:
                      BlocProvider.of<MainCubit>(context).startTutorial,
                  onTutorialFinish:
                      BlocProvider.of<MainCubit>(context).finishTutorial,
                );
              }
            },
          ),
        ],
        child: Builder(
          builder: (BuildContext context) {
            return MainScreen(
              cubit: BlocProvider.of<MainCubit>(context),
            );
          },
        ),
      ),
    );
  }

  static bool _listenMainWhen(MainState prev, MainState curr) {
    return !curr.isTutorialStarted && curr.isReadyForOnboarding;
  }
}
