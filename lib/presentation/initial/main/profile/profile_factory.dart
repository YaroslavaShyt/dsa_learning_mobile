import 'package:dsa_learning/core/navigation/inavigation_util.dart';
import 'package:dsa_learning/data/services/user/user_service.dart';
import 'package:dsa_learning/data/services/user/user_state.dart';
import 'package:dsa_learning/domain/handlers/iaudio_handler.dart';
import 'package:dsa_learning/main.dart';
import 'package:dsa_learning/presentation/initial/main/profile/bloc/profile_cubit.dart';
import 'package:dsa_learning/presentation/initial/main/profile/profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfileFactory {
  static Widget build(VoidCallback onInitialized) {
    return BlocProvider<ProfileCubit>(
      create: (BuildContext context) => ProfileCubit(
        onInitialized: onInitialized,
        audioHandler: sl.get<IAudioHandler>(),
        navigationUtil: sl.get<INavigationUtil>(),
        userService: BlocProvider.of<UserService>(context),
      )..init(),
      child: BlocListener<UserService, UserState>(
        listenWhen: _listenWhenUser,
        listener: (BuildContext context, UserState state) {
          BlocProvider.of<ProfileCubit>(context).init();
        },
        child: Builder(
          builder: (BuildContext context) {
            return ProfileScreen(
              cubit: BlocProvider.of<ProfileCubit>(context),
            );
          },
        ),
      ),
    );
  }

  static bool _listenWhenUser(UserState prev, UserState curr) {
    return prev.user?.profilePhoto != curr.user?.profilePhoto;
  }
}
