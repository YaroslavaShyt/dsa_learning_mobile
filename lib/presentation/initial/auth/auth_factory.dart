import 'package:dsa_learning/data/services/auth/auth_service.dart';
import 'package:dsa_learning/domain/handlers/iaudio_handler.dart';
import 'package:dsa_learning/main.dart';
import 'package:dsa_learning/presentation/initial/auth/auth_screen.dart';
import 'package:dsa_learning/presentation/initial/auth/bloc/auth_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuthFactory {
  static Widget build() {
    return BlocProvider<AuthCubit>(
      create: (BuildContext context) => AuthCubit(
        audioHandler: sl.get<IAudioHandler>(),
        authService: BlocProvider.of<AuthService>(context),
      ),
      child: Builder(
        builder: (BuildContext context) {
          return AuthScreen(
            cubit: BlocProvider.of<AuthCubit>(context),
          );
        },
      ),
    );
  }
}
