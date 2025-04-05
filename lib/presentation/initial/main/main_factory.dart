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
            statisticsCubit: BlocProvider.of<StatisticsCubit>(context),
          )..init(),
        ),
      ],
      child: Builder(
        builder: (BuildContext context) {
          return MainScreen(
            cubit: BlocProvider.of<MainCubit>(context),
          );
        },
      ),
    );
  }
}
