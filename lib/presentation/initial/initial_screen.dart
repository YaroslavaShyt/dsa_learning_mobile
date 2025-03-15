import 'package:dsa_learning/presentation/initial/auth/auth_factory.dart';
import 'package:dsa_learning/presentation/initial/bloc/initial_cubit.dart';
import 'package:dsa_learning/presentation/initial/bloc/initial_state.dart';
import 'package:dsa_learning/presentation/initial/loader/loader_factory.dart';
import 'package:dsa_learning/presentation/initial/main/main_factory.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class InitialScreen extends StatefulWidget {
  const InitialScreen({
    required this.cubit,
    super.key,
  });

  final InitialCubit cubit;

  @override
  State<InitialScreen> createState() => _InitialScreenState();
}

class _InitialScreenState extends State<InitialScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<InitialCubit, InitialState>(
      builder: (BuildContext context, InitialState state) {
        return switch (state.status) {
          InitialStatus.auth => AuthFactory.build(),
          InitialStatus.home => MainFactory.build(),
          InitialStatus.loading => LoaderFactory.build(
              LoaderArgs(
                loadingText: 'loading',
                loadedText: 'loaded',
              ),
            ),
        };
      },
    );
  }

  @override
  void dispose() {
    widget.cubit.close();
    super.dispose();
  }
}
