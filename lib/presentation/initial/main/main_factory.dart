import 'package:dsa_learning/data/services/user/user_service.dart';
import 'package:dsa_learning/data/services/user/user_state.dart';
import 'package:dsa_learning/domain/handlers/iaudio_handler.dart';
import 'package:dsa_learning/main.dart';
import 'package:dsa_learning/presentation/initial/main/bloc/main_cubit.dart';
import 'package:dsa_learning/presentation/initial/main/main_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'home/widgets/statistics/bloc/statistics_cubit.dart';

class MainFactory {
  static Widget build() {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (BuildContext context) => MainCubit(
            audioHandler: sl.get<IAudioHandler>(),
            isAudioEnabled: BlocProvider.of<UserService>(context).user!.sounds,
            statisticsCubit: BlocProvider.of<StatisticsCubit>(context),
          )..init(),
        ),
      ],
      child: BlocListener<UserService, UserState>(
        listenWhen: (p, c) =>
            c.user != null && p.user!.sounds != c.user!.sounds,
        listener: (BuildContext context, UserState state) {
          BlocProvider.of<MainCubit>(context)
              .updateSoundSettings(state.user!.sounds);
        },
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
}
