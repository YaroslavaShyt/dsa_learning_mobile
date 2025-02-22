import 'package:dsa_learning/presentation/initial/auth/auth_screen.dart';
import 'package:dsa_learning/presentation/initial/auth/bloc/auth_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuthFactory {
  static Widget build() {
    return BlocProvider<AuthCubit>(
      create: (_) => AuthCubit(),
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
