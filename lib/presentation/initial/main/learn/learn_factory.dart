import 'package:dsa_learning/core/navigation/inavigation_util.dart';
import 'package:dsa_learning/main.dart';
import 'package:dsa_learning/presentation/initial/main/learn/bloc/learn_cubit.dart';
import 'package:dsa_learning/presentation/initial/main/learn/learn_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LearnFactory {
  static Widget build() {
    return BlocProvider<LearnCubit>(
      create: (context) => LearnCubit(
        navigationUtil: sl.get<INavigationUtil>(),
      ),
      child: Builder(
        builder: (BuildContext context) {
          return LearnScreen(
            cubit: BlocProvider.of<LearnCubit>(context),
          );
        },
      ),
    );
  }
}
