import 'package:dsa_learning/presentation/initial/auth/auth_factory.dart';
import 'package:dsa_learning/presentation/initial/bloc/initial_cubit.dart';
import 'package:dsa_learning/presentation/initial/bloc/initial_state.dart';
import 'package:dsa_learning/presentation/initial/main/home/home_factory.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class InitialScreen extends StatelessWidget {
  const InitialScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<InitialCubit, InitialState>(
      builder: (BuildContext context, InitialState state) {
        return switch(state.status){
          InitialStatus.auth => AuthFactory.build(),
          InitialStatus.home => HomeFactory.build(),
          InitialStatus.loading =>
          const Center(child: CircularProgressIndicator(),),
        };
      },
    );
  }
}
