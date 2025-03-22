import 'package:dsa_learning/data/services/user/user_state.dart';
import 'package:dsa_learning/presentation/initial/bloc/initial_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class InitialCubit extends Cubit<InitialState> {
  InitialCubit() : super(const InitialState());

  Future<void> onUserStateChanged(UserStatus status) async {
    return switch (status) {
      UserStatus.initialized => {
          await Future.delayed(const Duration(seconds: 3)),
          emit(state.copyWith(status: InitialStatus.home)),
        },
      UserStatus.notInitialized =>
        emit(state.copyWith(status: InitialStatus.auth)),
      UserStatus.undefined =>
        emit(state.copyWith(status: InitialStatus.loading)),
    };
  }
}
