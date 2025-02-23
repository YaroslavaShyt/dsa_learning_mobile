import 'package:dsa_learning/data/auth/sign_in_model.dart';
import 'package:dsa_learning/data/auth/sign_up_model.dart';
import 'package:dsa_learning/domain/services/auth/iauth_service.dart';
import 'package:dsa_learning/presentation/initial/auth/bloc/auth_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit({
    required IAuthService authService,
  })  : _authService = authService,
        super(AuthState());

  final IAuthService _authService;

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

  Future<void> onConfirmOnLoginPressed() async {
   // if (!state.isLoginButtonActive) return;
    await _authService.signIn(
        signInModel: SignInModel(
          email: state.email,
          password: state.password,
        ));
  }

  Future<void> onConfirmOnSignUpPressed() async {
    // emit(state.copyWith(status: AuthStatus.startButtonPressed));
  //  if (!state.isSignUpButtonActive) return;
    await _authService.signUp(
        signUpModel: SignUpModel(
      name: state.name,
      email: state.email,
      password: state.password,
    ));
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
