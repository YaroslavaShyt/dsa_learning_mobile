import 'dart:async';

import 'package:dsa_learning/core/utils/logging/logger.dart';
import 'package:dsa_learning/data/services/auth/auth_state.dart';
import 'package:dsa_learning/data/services/user/user_state.dart';
import 'package:dsa_learning/domain/services/auth/iauth_service.dart';
import 'package:dsa_learning/domain/services/user/iuser_service.dart';
import 'package:dsa_learning/domain/user/iuser.dart';
import 'package:dsa_learning/domain/user/iuser_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UserService extends Cubit<UserState> implements IUserService {
  UserService({
    required IAuthService authService,
    required IUserRepository userRepository,
  })  : _authService = authService,
        _userRepository = userRepository,
        super(const UserState());

  @override
  IUser? get user => state.user;

  final IAuthService _authService;
  final IUserRepository _userRepository;

  StreamSubscription<AuthState>? _authStream;

  void onAuthStateChanged() {
    _authStream = _authService.stream.listen(
      (AuthState authState) {
        return switch (authState.status) {
          AuthStatus.loading =>
            emit(state.copyWith(status: UserStatus.notInitialized)),
          AuthStatus.authorized => init(),
          AuthStatus.notAuthorized =>
            emit(state.copyWith(status: UserStatus.notInitialized)),
        };
      },
    );
  }

  @override
  Future<void> init() async {
    try {
      final IUser? user = await _userRepository.getUser();
      emit(
        state.copyWith(
          status:
              user == null ? UserStatus.notInitialized : UserStatus.initialized,
          user: user,
        ),
      );
    } catch (error) {
      logger.e(error);
    }
  }

  @override
  Future<void> close() {
    _authStream?.cancel();
    return super.close();
  }
}
