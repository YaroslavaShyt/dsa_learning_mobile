import 'dart:async';

import 'package:dsa_learning/core/constants/duration.dart';
import 'package:dsa_learning/core/utils/mixins/snackbar_mixin.dart';
import 'package:dsa_learning/core/utils/theme/app_color_theme.dart';
import 'package:dsa_learning/core/utils/theme/text_theme.dart';
import 'package:dsa_learning/presentation/initial/auth/bloc/auth_cubit.dart';
import 'package:dsa_learning/presentation/initial/auth/bloc/auth_state.dart';
import 'package:dsa_learning/presentation/initial/loader/loader_factory.dart';
import 'package:dsa_learning/presentation/initial/main/learn/lesson_finished/widgets/stars_background.dart';
import 'package:dsa_learning/presentation/widgets/animated_gestures/tap_animated_widget.dart';
import 'package:dsa_learning/presentation/widgets/buttons/main_outlined_button.dart';
import 'package:dsa_learning/presentation/widgets/input/main_text_field.dart';
import 'package:dsa_learning/presentation/widgets/lottie_animations/robot_animation.dart';
import 'package:dsa_learning/presentation/widgets/main_background.dart';
import 'package:dsa_learning/presentation/widgets/main_container.dart';
import 'package:dsa_learning/presentation/widgets/main_shadow.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'widgets/_back_button.dart';
part 'widgets/_sign_in_content.dart';
part 'widgets/_sign_up_content.dart';
part 'widgets/_start_button_pressed_content.dart';
part 'widgets/_start_content.dart';
part 'widgets/auth_slider/_auth_slider.dart';
part 'widgets/auth_slider/_auth_text.dart';
part 'widgets/auth_slider/_slider_components.dart';
part 'widgets/auth_slider/_slider_indicators.dart';
part 'widgets/auth_slider/_slider_with_dots.dart';

class AuthScreen extends StatelessWidget with SnackBarMixin {
  const AuthScreen({
    required this.cubit,
    super.key,
  });

  final AuthCubit cubit;

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.sizeOf(context);

    return Scaffold(
      body: BlocConsumer<AuthCubit, AuthCubitState>(
        listener: (_, AuthCubitState state) {
          if (state.status == AuthCubitStatus.authFail) {
            showSnackBar(
              context,
              text: context.tr('authError'),
            );
          }
        },
        builder: (_, AuthCubitState state) {
          return PopScope(
            canPop: state.status == AuthCubitStatus.initial,
            onPopInvokedWithResult: (didPop, result) {
              if (didPop) return;
              if (state.status == AuthCubitStatus.startButtonPressed) {
                cubit.onBackOnStartPressed();
              }
              if (state.status == AuthCubitStatus.signInButtonPressed ||
                  state.status == AuthCubitStatus.signUpButtonPressed) {
                cubit.onBackOnLoginPressed();
              }
            },
            child: Stack(
              children: [
                const MainBackground(),
                const StarsBackground(isLogin: true),
                SizedBox(
                  height: size.height,
                  child: Center(
                    child: SingleChildScrollView(
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          if (state.status == AuthCubitStatus.initial)
                            _StartContent(
                              onSliderIndexChanged: cubit.onSliderPageChanged,
                              selectedIndex: state.selectedIndex,
                              onStartButtonPressed: cubit.onStartButtonPressed,
                            ),
                          if (state.status == AuthCubitStatus.authFail ||
                              state.status ==
                                  AuthCubitStatus.startButtonPressed)
                            _StartButtonPressedContent(
                              onBackTapped: cubit.onBackOnStartPressed,
                              onSignInButtonPressed:
                                  cubit.onSignInButtonPressed,
                              onSignUpButtonPressed:
                                  cubit.onSignUpButtonPressed,
                            ),
                          if (state.status ==
                              AuthCubitStatus.signInButtonPressed)
                            _SignInContent(
                              isButtonActive: state.isLoginButtonActive,
                              onEmailEntered: cubit.onEmailEntered,
                              onPasswordEntered: cubit.onPasswordEntered,
                              onBackTapped: cubit.onBackOnLoginPressed,
                              onConfirmButtonPressed:
                                  cubit.onConfirmOnLoginPressed,
                            ),
                          if (state.status ==
                              AuthCubitStatus.signUpButtonPressed)
                            _SignUpContent(
                              onNameEntered: cubit.onNameOnSignUpEntered,
                              onEmailEntered: cubit.onEmailOnSignUpEntered,
                              onPasswordEntered:
                                  cubit.onPasswordOnSignUpEntered,
                              onConfirmPasswordEntered:
                                  cubit.onConfirmPasswordOnSignUpEntered,
                              isButtonActive: state.isSignUpButtonActive,
                              onBackTapped: cubit.onBackOnLoginPressed,
                              onConfirmButtonPressed:
                                  cubit.onConfirmOnSignUpPressed,
                            ),
                          if (state.status == AuthCubitStatus.authInProgress)
                            LoaderFactory.build(),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
