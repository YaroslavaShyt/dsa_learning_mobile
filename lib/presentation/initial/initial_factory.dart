import 'package:dsa_learning/data/services/user/user_service.dart';
import 'package:dsa_learning/data/services/user/user_state.dart';
import 'package:dsa_learning/presentation/initial/bloc/initial_cubit.dart';
import 'package:dsa_learning/presentation/initial/initial_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class InitialFactory {
  static Widget build() {
    return BlocProvider<InitialCubit>(
      create: (_) => InitialCubit(),
      child: BlocListener<UserService, UserState>(
        listenWhen: (prev, curr) => prev.status != curr.status,
        listener: (BuildContext context, UserState state) {
          BlocProvider.of<InitialCubit>(context)
              .onUserStateChanged(state.status);
        },
        child: Builder(
          builder: (BuildContext context) {
            return InitialScreen(
              cubit: BlocProvider.of<InitialCubit>(context),
            );
          },
        ),
      ),
    );
  }
}
