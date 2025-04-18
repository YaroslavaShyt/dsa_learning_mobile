import 'dart:ui';

import 'package:dsa_learning/core/navigation/inavigation_util.dart';
import 'package:dsa_learning/core/utils/logging/logger.dart';
import 'package:dsa_learning/domain/handlers/iaudio_handler.dart';
import 'package:dsa_learning/domain/services/user/iuser_service.dart';
import 'package:dsa_learning/domain/user/iuser.dart';
import 'package:dsa_learning/presentation/initial/main/profile/bloc/profile_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit({
    required IAudioHandler audioHandler,
    required INavigationUtil navigationUtil,
    required IUserService userService,
    required VoidCallback onInitialized,
  })  : _navigationUtil = navigationUtil,
        _userService = userService,
        _audioHandler = audioHandler,
        _onInitialized = onInitialized,
        super(const ProfileState());

  final IAudioHandler _audioHandler;
  final INavigationUtil _navigationUtil;
  final IUserService _userService;
  final VoidCallback _onInitialized;

  IUser get _user => _userService.user!;

  String get userName => _user.firstName;

  Future<void> init() async {
    try {
      emit(
        state.copyWith(
          profilePhoto: _user.profilePhoto,
          isSoundEnabled: _user.sounds,
          isVibrationEnabled: _user.vibration,
          isAnimationEnabled: _user.animations,
        ),
      );
      _onInitialized();
    } catch (error) {
      logger.e(error);
    }
  }

  void onLanguageTap() {
    _audioHandler.playButtonSound(_userService.user!.sounds);
    emit(state.copyWith(isLanguageShown: !state.isLanguageShown));
  }

  Future<void> onDeleteAccountTap() async {
    try {
      _audioHandler.playButtonSound(_userService.user!.sounds);
      _navigationUtil.navigateBack();
      await _userService.deleteUser();
    } catch (error) {
      logger.e(error);
    }
  }

  void playSound() {
    _audioHandler.playButtonSound(_userService.user!.sounds);
  }

  void onAboutInfoTap() {
    _audioHandler.playButtonSound(_userService.user!.sounds);
    emit(state.copyWith(isAboutInfoShown: !state.isAboutInfoShown));
  }

  Future<void> onExitTap() async {
    _audioHandler.playButtonSound(_userService.user!.sounds);
    _navigationUtil.navigateBack();
    await _userService.cleanUserData();
  }

  void onCancelTap() {
    _audioHandler.playButtonSound(_userService.user!.sounds);
    _navigationUtil.navigateBack();
  }

  Future<void> onVibrationTap() async {
    try {
      _audioHandler.playButtonSound(_userService.user!.sounds);
      emit(state.copyWith(isVibrationEnabled: !state.isVibrationEnabled));
      await _userService.updateUser(vibration: state.isVibrationEnabled);
    } catch (error) {
      logger.e(error);
    }
  }

  Future<void> onSoundTap() async {
    try {
      _audioHandler.playButtonSound(_userService.user!.sounds);
      emit(state.copyWith(isSoundEnabled: !state.isSoundEnabled));
      await _userService.updateUser(sound: state.isSoundEnabled);
    } catch (error) {
      logger.e(error);
    }
  }

  Future<void> onAnimationTap() async {
    try {
      _audioHandler.playButtonSound(_userService.user!.sounds);
      emit(state.copyWith(isAnimationEnabled: !state.isAnimationEnabled));
      await _userService.updateUser(animation: state.isAnimationEnabled);
    } catch (error) {
      logger.e(error);
    }
  }
}
