import 'package:equatable/equatable.dart';

enum AuthCubitStatus {
  initial,
  startButtonPressed,
  signInButtonPressed,
  signUpButtonPressed,
  authInProgress,
  authFail,
}

class AuthCubitState extends Equatable {
  const AuthCubitState({
    this.status = AuthCubitStatus.initial,
    this.email = 'yaso11chkashyt@gmail.com',
    this.name = '',
    this.password = 'slavka',
    this.confirmPassword = '',
    this.isLoginButtonActive = false,
    this.isSignUpButtonActive = false,
    this.selectedIndex = 0,
  });

  AuthCubitState copyWith({
    String? name,
    String? email,
    String? password,
    AuthCubitStatus? status,
    String? confirmPassword,
    bool? isLoginButtonActive,
    bool? isSignUpButtonActive,
    int? selectedIndex,
  }) {
    return AuthCubitState(
      name: name ?? this.name,
      email: email ?? this.email,
      status: status ?? this.status,
      password: password ?? this.password,
      selectedIndex: selectedIndex ?? this.selectedIndex,
      confirmPassword: confirmPassword ?? this.confirmPassword,
      isLoginButtonActive: isLoginButtonActive ?? this.isLoginButtonActive,
      isSignUpButtonActive: isSignUpButtonActive ?? this.isSignUpButtonActive,
    );
  }

  final String name;
  final String email;
  final String password;
  final AuthCubitStatus status;
  final String confirmPassword;
  final bool isLoginButtonActive;
  final bool isSignUpButtonActive;
  final int selectedIndex;

  @override
  List<Object?> get props => [
        status,
        email,
        name,
        confirmPassword,
        password,
        isLoginButtonActive,
        isSignUpButtonActive,
        selectedIndex,
      ];
}
