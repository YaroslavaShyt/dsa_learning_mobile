import 'package:equatable/equatable.dart';

enum AuthStatus {
  initial,
  startButtonPressed,
  signInButtonPressed,
  signUpButtonPressed,
}

class AuthState extends Equatable {
  const AuthState({
    this.status = AuthStatus.initial,
    this.email = 'yaso11chkashyt@gmail.com',
    this.name = '',
    this.password = 'slavka',
    this.confirmPassword = '',
    this.isLoginButtonActive = false,
    this.isSignUpButtonActive = false,
  });

  AuthState copyWith({
    AuthStatus? status,
    String? email,
    String? password,
    String? name,
    bool? isLoginButtonActive,
    bool? isSignUpButtonActive,
  }) {
    return AuthState(
      name: name ?? this.name,
      status: status ?? this.status,
      email: email ?? this.email,
      password: password ?? this.password,
      isLoginButtonActive: isLoginButtonActive ?? this.isLoginButtonActive,
      isSignUpButtonActive: isSignUpButtonActive ?? this.isSignUpButtonActive,
    );
  }

  final AuthStatus status;
  final String email;
  final String password;
  final String name;
  final String confirmPassword;
  final bool isLoginButtonActive;
  final bool isSignUpButtonActive;

  @override
  List<Object?> get props => [
        status,
        email,
        name,
        confirmPassword,
        password,
        isLoginButtonActive,
        isSignUpButtonActive,
      ];
}
