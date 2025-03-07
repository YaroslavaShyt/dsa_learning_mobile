import 'package:dsa_learning/domain/services/achievements/iachievements_service.dart';
import 'package:dsa_learning/main.dart';
import 'package:dsa_learning/presentation/initial/main/home/bloc/home_cubit.dart';
import 'package:dsa_learning/presentation/initial/main/home/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeFactory {
  static Widget build() {
    return BlocProvider<HomeCubit>(
      create: (_) => HomeCubit(
        achievementsService: sl.get<IAchievementsService>(),
      )..init(),
      child: Builder(
        builder: (BuildContext context) {
          return HomeScreen(
            cubit: BlocProvider.of<HomeCubit>(context),
          );
        },
      ),
    );
  }
}
