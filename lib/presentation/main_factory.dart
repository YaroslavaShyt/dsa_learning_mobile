import 'package:dsa_learning/presentation/main/bloc/main_cubit.dart';
import 'package:dsa_learning/presentation/main/main_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MainFactory {
  static Widget build() {
    return BlocProvider(
      create: (_) => MainCubit(),
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
