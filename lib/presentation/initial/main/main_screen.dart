import 'package:dsa_learning/core/utils/theme/app_color_theme.dart';
import 'package:dsa_learning/presentation/initial/main/bloc/main_cubit.dart';
import 'package:dsa_learning/presentation/initial/main/bloc/main_state.dart';
import 'package:dsa_learning/presentation/initial/main/home/home_factory.dart';
import 'package:dsa_learning/presentation/initial/main/learn/learn_factory.dart';
import 'package:dsa_learning/presentation/initial/main/profile/profile_factory.dart';
import 'package:dsa_learning/presentation/widgets/main_shadow.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'widgets/button_component.dart';
part 'widgets/main_floating_action_button.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({
    required this.cubit,
    super.key,
  });

  final MainCubit cubit;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MainCubit, MainState>(
      builder: (_, MainState state) {
        return Scaffold(
          body: Stack(
            children: [
              IndexedStack(
                index: state.selectedIndex,
                children: [
                  HomeFactory.build(),
                  LearnFactory.build(),
                  ProfileFactory.build(),
                ],
              ),
              Positioned.directional(
                start: 100,
                end: 100,
                bottom: 30,
                textDirection: TextDirection.ltr,
                child: _MainFloatingActionButton(
                  onChanged: cubit.onTabChanged,
                  selectedIndex: state.selectedIndex,
                  onHomeTapped: () => cubit.onTabChanged(0),
                  onLearnTapped: () => cubit.onTabChanged(1),
                  onProfileTapped: () => cubit.onTabChanged(2),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
