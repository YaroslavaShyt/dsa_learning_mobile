import 'package:dsa_learning/presentation/initial/auth/bloc/auth_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuthCubit extends Cubit<AuthState>{
  AuthCubit() : super(AuthState());

  void onStartButtonPressed(){
    emit(state.copyWith(status: AuthStatus.startButtonPressed));
  }

  void onSignInButtonPressed(){
    emit(state.copyWith(status: AuthStatus.signInButtonPressed));
  }

  void onSignUpButtonPressed(){
    emit(state.copyWith(status: AuthStatus.signUpButtonPressed));
  }
}