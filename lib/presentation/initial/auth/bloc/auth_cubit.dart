import 'dart:async';

import 'package:dsa_learning/core/utils/logging/logger.dart';
import 'package:dsa_learning/core/utils/validators/input_validators.dart';
import 'package:dsa_learning/data/auth/sign_in_model.dart';
import 'package:dsa_learning/data/auth/sign_up_model.dart';
import 'package:dsa_learning/domain/handlers/iaudio_handler.dart';
import 'package:dsa_learning/domain/services/auth/iauth_service.dart';
import 'package:dsa_learning/presentation/initial/auth/bloc/auth_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuthCubit extends Cubit<AuthCubitState> {
  AuthCubit({
    required IAuthService authService,
    required IAudioHandler audioHandler,
  })  : _authService = authService,
        _audioHandler = audioHandler,
        super(const AuthCubitState());

  final IAuthService _authService;
  final IAudioHandler _audioHandler;

  bool _isValidPassword(String password) =>
      InputValidators.isValidPassword(password);

  bool _isValidEmail(String email) => InputValidators.isValidEmail(email);

  bool _isValidName(String name) => InputValidators.isValidName(name);

  Future<void> onConfirmOnLoginPressed() async {
    try {
      if (!state.isLoginButtonActive) return;

      _audioHandler.playButtonSound(true);

      emit(state.copyWith(status: AuthCubitStatus.authInProgress));

      await _authService.signIn(
        signInModel: SignInModel(
          email: state.email,
          password: state.password,
        ),
      );
    } catch (error) {
      logger.e(error);
      emit(state.copyWith(status: AuthCubitStatus.authFail));
    }
  }

  Future<void> onConfirmOnSignUpPressed() async {
    try {
      if (!state.isSignUpButtonActive) return;

      _audioHandler.playButtonSound(true);

      emit(state.copyWith(status: AuthCubitStatus.authInProgress));

      await _authService.signUp(
        signUpModel: SignUpModel(
          name: state.name,
          email: state.email,
          password: state.password,
        ),
      );
    } catch (error) {
      logger.e(error);
      emit(state.copyWith(status: AuthCubitStatus.authFail));
    }
  }

  void onEmailEntered(String email) {
    final bool isButtonActive =
        _isValidPassword(state.password) && _isValidEmail(email);
    emit(state.copyWith(email: email, isLoginButtonActive: isButtonActive));
  }

  void onPasswordEntered(String password) {
    final bool isButtonActive =
        _isValidPassword(password) && _isValidEmail(state.email);

    emit(
      state.copyWith(
        password: password,
        isLoginButtonActive: isButtonActive,
      ),
    );
  }

  void onNameOnSignUpEntered(String name) {
    final bool isButtonActive = _isValidName(name) &&
        _isValidEmail(state.email) &&
        _isValidPassword(state.confirmPassword) &&
        _isValidPassword(state.password);

    emit(state.copyWith(name: name, isSignUpButtonActive: isButtonActive));
  }

  void onEmailOnSignUpEntered(String email) {
    final bool isButtonActive = _isValidName(state.name) &&
        _isValidEmail(email) &&
        _isValidPassword(state.confirmPassword) &&
        _isValidPassword(state.password);

    emit(state.copyWith(email: email, isSignUpButtonActive: isButtonActive));
  }

  void onPasswordOnSignUpEntered(String password) {
    final bool isButtonActive = _isValidName(state.name) &&
        _isValidEmail(state.email) &&
        _isValidPassword(state.confirmPassword) &&
        _isValidPassword(password);

    emit(
      state.copyWith(
        password: password,
        isSignUpButtonActive: isButtonActive,
      ),
    );
  }

  void onConfirmPasswordOnSignUpEntered(String confirmPassword) {
    final bool isButtonActive = _isValidName(state.name) &&
        _isValidEmail(state.email) &&
        _isValidPassword(confirmPassword) &&
        _isValidPassword(state.password);

    emit(
      state.copyWith(
        confirmPassword: confirmPassword,
        isSignUpButtonActive: isButtonActive,
      ),
    );
  }

  void onStartButtonPressed() {
    _audioHandler.playButtonSound(true);

    emit(
      state.copyWith(
        status: AuthCubitStatus.startButtonPressed,
        email: '',
        password: '',
        confirmPassword: '',
        name: '',
        isLoginButtonActive: false,
        isSignUpButtonActive: false,
      ),
    );
  }

  void onSignInButtonPressed() {
    _audioHandler.playButtonSound(true);

    emit(
      state.copyWith(
        status: AuthCubitStatus.signInButtonPressed,
        email: '',
        password: '',
        confirmPassword: '',
        name: '',
        isLoginButtonActive: false,
        isSignUpButtonActive: false,
      ),
    );
  }

  void onSignUpButtonPressed() {
    _audioHandler.playButtonSound(true);

    emit(
      state.copyWith(
        status: AuthCubitStatus.signUpButtonPressed,
        email: '',
        password: '',
        confirmPassword: '',
        name: '',
        isLoginButtonActive: false,
        isSignUpButtonActive: false,
      ),
    );
  }

  void onBackOnStartPressed({bool playSound = true}) {
    if (playSound) _audioHandler.playButtonSound(true);

    emit(
      state.copyWith(
        status: AuthCubitStatus.initial,
        email: '',
        password: '',
        confirmPassword: '',
        name: '',
        isLoginButtonActive: false,
        isSignUpButtonActive: false,
      ),
    );
  }

  void onBackOnLoginPressed({bool playSound = true}) {
    if (playSound) _audioHandler.playButtonSound(true);

    emit(
      state.copyWith(
        status: AuthCubitStatus.startButtonPressed,
        email: '',
        password: '',
        confirmPassword: '',
        name: '',
        isLoginButtonActive: false,
        isSignUpButtonActive: false,
      ),
    );
  }

  void onSliderPageChanged(int index) {
    if (index != state.selectedIndex) {
      emit(state.copyWith(selectedIndex: index));
    }
  }
}
