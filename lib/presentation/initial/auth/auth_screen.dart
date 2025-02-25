import 'dart:async';

import 'package:dsa_learning/core/constants/duration.dart';
import 'package:dsa_learning/core/utils/theme/app_color_theme.dart';
import 'package:dsa_learning/core/utils/theme/text_theme.dart';
import 'package:dsa_learning/presentation/initial/auth/bloc/auth_cubit.dart';
import 'package:dsa_learning/presentation/initial/auth/bloc/auth_state.dart';
import 'package:dsa_learning/presentation/widgets/input/main_text_field.dart';
import 'package:dsa_learning/presentation/widgets/main_background.dart';
import 'package:dsa_learning/presentation/widgets/main_container.dart';
import 'package:dsa_learning/presentation/widgets/buttons/main_outlined_button.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'widgets/auth_slider/_auth_text.dart';

part 'widgets/_start_content.dart';

part 'widgets/_start_button_pressed_content.dart';

part 'widgets/_back_button.dart';

part 'widgets/_sign_in_content.dart';

part 'widgets/_sign_up_content.dart';

part 'widgets/auth_slider/_auth_slider.dart';

part 'widgets/auth_slider/_slider_components.dart';

part 'widgets/auth_slider/_slider_indicators.dart';

class AuthScreen extends StatelessWidget {
  const AuthScreen({
    required this.cubit,
    super.key,
  });

  final AuthCubit cubit;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<AuthCubit, AuthState>(
        builder: (_, AuthState state) {
          return Stack(
            fit: StackFit.expand,
            children: [
              const MainBackground(),
              if (state.status == AuthStatus.initial)
                _StartContent(
                  onSliderIndexChanged: cubit.onSliderPageChanged,
                  selectedIndex: state.selectedIndex,
                  onStartButtonPressed: cubit.onStartButtonPressed,
                ),
              if (state.status == AuthStatus.startButtonPressed)
                _StartButtonPressedContent(
                  onBackTapped: cubit.onBackOnStartPressed,
                  onSignInButtonPressed: cubit.onSignInButtonPressed,
                  onSignUpButtonPressed: cubit.onSignUpButtonPressed,
                ),
              if (state.status == AuthStatus.signInButtonPressed)
                _SignInContent(
                  isButtonActive: state.isLoginButtonActive,
                  onEmailEntered: cubit.onEmailEntered,
                  onPasswordEntered: cubit.onPasswordEntered,
                  onBackTapped: cubit.onBackOnLoginPressed,
                  onConfirmButtonPressed: cubit.onConfirmOnLoginPressed,
                ),
              if(state.status == AuthStatus.signUpButtonPressed)
                _SignUpContent(
                  isButtonActive: state.isSignUpButtonActive,
                  onEmailEntered: cubit.onEmailEntered,
                  onPasswordEntered: cubit.onPasswordEntered,
                  onBackTapped: cubit.onBackOnLoginPressed,
                  onConfirmButtonPressed: cubit.onConfirmOnLoginPressed,
                ),
            ],
          );
        },
      ),
    );
  }
}
