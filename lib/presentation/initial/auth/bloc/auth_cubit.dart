import 'package:dsa_learning/presentation/initial/auth/bloc/auth_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthState());

  void onStartButtonPressed() {
    emit(state.copyWith(status: AuthStatus.startButtonPressed));
  }

  void onSignInButtonPressed() {
    emit(state.copyWith(status: AuthStatus.signInButtonPressed));
  }

  void onSignUpButtonPressed() {
    emit(state.copyWith(status: AuthStatus.signUpButtonPressed));
  }

  void onBackOnStartPressed() {
    emit(state.copyWith(status: AuthStatus.initial));
  }

  void onBackOnLoginPressed() {
    emit(state.copyWith(status: AuthStatus.startButtonPressed));
  }

  void onConfirmOnLoginPressed() {
    // emit(state.copyWith(status: AuthStatus.startButtonPressed));
  }

  void onEmailEntered(String email) {
    emit(state.copyWith(
      email: email,
      isLoginButtonActive: state.password.isNotEmpty && email.isNotEmpty,
    ));
  }

  void onPasswordEntered(String password) {
    emit(state.copyWith(
      password: password,
      isLoginButtonActive: password.isNotEmpty && state.email.isNotEmpty,
    ));
  }

  void onNameOnSignUpEntered(String name) {
    emit(state.copyWith(
      name: name,
      isSignUpButtonActive: state.password.isNotEmpty &&
          state.confirmPassword.isNotEmpty &&
          state.password == state.confirmPassword &&
          name.isNotEmpty,
    ));
  }

  void onEmailOnSignUpEntered(String email) {
    emit(state.copyWith(
      email: email,
      isSignUpButtonActive: state.password.isNotEmpty &&
          state.confirmPassword.isNotEmpty &&
          state.password == state.confirmPassword &&
          email.isNotEmpty,
    ));
  }

  void onPasswordOnSignUpEntered(String password) {
    emit(state.copyWith(
      password: password,
      isSignUpButtonActive: password.isNotEmpty &&
          state.confirmPassword.isNotEmpty &&
          state.password == state.confirmPassword &&
          state.email.isNotEmpty,
    ));
  }
}
