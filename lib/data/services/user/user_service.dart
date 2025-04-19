import 'dart:async';

import 'package:dsa_learning/core/exceptions/user_not_found_exception.dart';
import 'package:dsa_learning/core/utils/logging/logger.dart';
import 'package:dsa_learning/data/services/auth/auth_state.dart';
import 'package:dsa_learning/data/services/user/user_state.dart';
import 'package:dsa_learning/domain/services/auth/iauth_service.dart';
import 'package:dsa_learning/domain/services/rewards/irewards_service.dart';
import 'package:dsa_learning/domain/services/user/iuser_service.dart';
import 'package:dsa_learning/domain/user/iuser.dart';
import 'package:dsa_learning/domain/user/iuser_repository.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UserService extends Cubit<UserState> implements IUserService {
  UserService({
    required IAuthService authService,
    required IUserRepository userRepository,
    required IRewardsService rewardsService,
  })  : _authService = authService,
        _userRepository = userRepository,
        _rewardsService = rewardsService,
        super(const UserState());

  @override
  IUser? get user => state.user;

  final IAuthService _authService;
  final IUserRepository _userRepository;
  final IRewardsService _rewardsService;

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
      final UserStatus status =
          user == null ? UserStatus.notInitialized : UserStatus.initialized;

      if (user != null) {
        _rewardsService.init(
          bytes: user.bytes,
          hash: user.hash,
          vents: user.fans <= 5 ? user.fans : 5,
        );
      }
      emit(state.copyWith(status: status, user: user));
    } on UserNotFoundException catch (_) {
      cleanUserData();
    } catch (error) {
      logger.e(error);
    }
  }

  @override
  Future<void> updateUser({
    String? profilePhoto,
    List<String>? unlockedAvatars,
    bool? vibration,
    bool? sound,
    bool? animation,
    bool? isOnboarded,
  }) async {
    try {
      emit(
        state.copyWith(
          user: user?.copyWith(
            profilePhoto: profilePhoto,
            unlockedAvatars: unlockedAvatars,
            vibration: vibration,
            sounds: sound,
            animations: animation,
            isOnboarded: isOnboarded,
          ),
        ),
      );
      await _userRepository.updateUser(
        state.user!.toJson(state.user!),
      );
    } catch (error) {
      logger.e(error);
    }
  }

  @override
  Future<void> cleanUserData() async {
    await _authService.signOut();
  }

  @override
  Future<void> deleteUser() async {
    try {
      final bool isDeleted = await _userRepository.deleteUser();

      if (!isDeleted) {
        debugPrint("not deleted");
        return;
      }

      await cleanUserData();
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
