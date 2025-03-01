import 'dart:async';

import 'package:dsa_learning/core/utils/logging/logger.dart';
import 'package:dsa_learning/core/utils/validators/input_validators.dart';
import 'package:dsa_learning/data/auth/sign_in_model.dart';
import 'package:dsa_learning/data/auth/sign_up_model.dart';
import 'package:dsa_learning/domain/services/auth/iauth_service.dart';
import 'package:dsa_learning/presentation/initial/auth/bloc/auth_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuthCubit extends Cubit<AuthCubitState> {
  AuthCubit({
    required IAuthService authService,
  })  : _authService = authService,
        super(const AuthCubitState());

  final IAuthService _authService;

  Future<void> onConfirmOnLoginPressed() async {
    try {
      if (!state.isLoginButtonActive) return;

      emit(state.copyWith(status: AuthCubitStatus.authInProgress));

      await _authService.signIn(
          signInModel: SignInModel(
        email: state.email,
        password: state.password,
      ));
    } catch (error) {
      logger.e(error);
      emit(state.copyWith(status: AuthCubitStatus.authFail));
    }
  }

  Future<void> onConfirmOnSignUpPressed() async {
    try {
      if (!state.isSignUpButtonActive) return;

      emit(state.copyWith(status: AuthCubitStatus.authInProgress));

      await _authService.signUp(
          signUpModel: SignUpModel(
        name: state.name,
        email: state.email,
        password: state.password,
      ));
    } catch (error) {
      logger.e(error);
      emit(state.copyWith(status: AuthCubitStatus.authFail));
    }
  }

  void onEmailEntered(String email) {
    emit(
      state.copyWith(
        email: email,
        isLoginButtonActive: InputValidators.isValidPassword(state.password) &&
            InputValidators.isValidEmail(email),
      ),
    );
  }

  void onPasswordEntered(String password) {
    emit(
      state.copyWith(
        password: password,
        isLoginButtonActive: InputValidators.isValidPassword(password) &&
            InputValidators.isValidEmail(state.email),
      ),
    );
  }

  void onNameOnSignUpEntered(String name) {
    emit(
      state.copyWith(
        name: name,
        isSignUpButtonActive: InputValidators.isValidName(name) &&
            InputValidators.isValidEmail(state.email) &&
            InputValidators.isValidPassword(state.confirmPassword) &&
            InputValidators.isValidPassword(state.password),
      ),
    );
  }

  void onEmailOnSignUpEntered(String email) {
    emit(
      state.copyWith(
        email: email,
        isSignUpButtonActive: InputValidators.isValidName(state.name) &&
            InputValidators.isValidEmail(email) &&
            InputValidators.isValidPassword(state.confirmPassword) &&
            InputValidators.isValidPassword(state.password),
      ),
    );
  }

  void onPasswordOnSignUpEntered(String password) {
    emit(
      state.copyWith(
        password: password,
        isSignUpButtonActive: InputValidators.isValidName(state.name) &&
            InputValidators.isValidEmail(state.email) &&
            InputValidators.isValidPassword(state.confirmPassword) &&
            InputValidators.isValidPassword(password),
      ),
    );
  }

  void onConfirmPasswordOnSignUpEntered(String confirmPassword) {
    emit(
      state.copyWith(
        confirmPassword: confirmPassword,
        isSignUpButtonActive: InputValidators.isValidName(state.name) &&
            InputValidators.isValidEmail(state.email) &&
            InputValidators.isValidPassword(confirmPassword) &&
            InputValidators.isValidPassword(state.password),
      ),
    );
  }

  void onStartButtonPressed() {
    emit(state.copyWith(status: AuthCubitStatus.startButtonPressed));
  }

  void onSignInButtonPressed() {
    emit(state.copyWith(status: AuthCubitStatus.signInButtonPressed));
  }

  void onSignUpButtonPressed() {
    emit(state.copyWith(status: AuthCubitStatus.signUpButtonPressed));
  }

  void onBackOnStartPressed() {
    emit(state.copyWith(status: AuthCubitStatus.initial));
  }

  void onBackOnLoginPressed() {
    emit(state.copyWith(status: AuthCubitStatus.startButtonPressed));
  }

  void onSliderPageChanged(int index) {
    if (index != state.selectedIndex) {
      emit(state.copyWith(selectedIndex: index));
    }
  }
}
