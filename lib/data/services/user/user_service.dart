import 'dart:async';

import 'package:dsa_learning/data/services/auth/auth_state.dart';
import 'package:dsa_learning/data/services/user/user_state.dart';
import 'package:dsa_learning/domain/services/auth/iauth_service.dart';
import 'package:dsa_learning/domain/services/user/iuser_service.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UserService extends Cubit<UserState> implements IUserService {
  UserService({
    required IAuthService authService,
  })  : _authService = authService,
        super(const UserState());

  final IAuthService _authService;

  StreamSubscription<AuthState>? _authStream;

  void onAuthStateChanged() {
    _authStream = _authService.stream.listen(
      (AuthState authState) {
        return switch (authState.status) {
          AuthStatus.loading =>
            emit(state.copyWith(status: UserStatus.notInitialized)),
          AuthStatus.authorized =>
            emit(state.copyWith(status: UserStatus.initialized)),
          AuthStatus.notAuthorized =>
            emit(state.copyWith(status: UserStatus.notInitialized)),
        };
      },
    );
  }

  @override
  Future<void> init() {
    // TODO: implement init
    throw UnimplementedError();
  }

  @override
  Future<void> close() {
    _authStream?.cancel();
    return super.close();
  }
}
