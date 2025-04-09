import 'package:dsa_learning/core/navigation/inavigation_util.dart';
import 'package:dsa_learning/core/utils/logging/logger.dart';
import 'package:dsa_learning/domain/services/user/iuser_service.dart';
import 'package:dsa_learning/domain/user/iuser.dart';
import 'package:dsa_learning/presentation/initial/main/profile/bloc/profile_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit({
    required INavigationUtil navigationUtil,
    required IUserService userService,
  })  : _navigationUtil = navigationUtil,
        _userService = userService,
        super(const ProfileState());

  final INavigationUtil _navigationUtil;
  final IUserService _userService;

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
    } catch (error) {
      logger.e(error);
    }
  }

  void onLanguageTap() {
    emit(state.copyWith(isLanguageShown: !state.isLanguageShown));
  }

  void onDeleteAccountTap() {}

  void onAboutInfoTap() {
    emit(state.copyWith(isAboutInfoShown: !state.isAboutInfoShown));
  }

  Future<void> onExitTap() async {
    _navigationUtil.navigateBack();
    await _userService.cleanUserData();
  }

  void onCancelTap() {
    _navigationUtil.navigateBack();
  }

  Future<void> onVibrationTap() async {
    try {
      emit(state.copyWith(isVibrationEnabled: !state.isVibrationEnabled));
      await _userService.updateUser(vibration: state.isVibrationEnabled);
    } catch (error) {
      logger.e(error);
    }
  }

  Future<void> onSoundTap() async {
    try {
      emit(state.copyWith(isSoundEnabled: !state.isSoundEnabled));
      await _userService.updateUser(sound: state.isSoundEnabled);
    } catch (error) {
      logger.e(error);
    }
  }

  Future<void> onAnimationTap() async {
    try {
      emit(state.copyWith(isAnimationEnabled: !state.isAnimationEnabled));
      await _userService.updateUser(animation: state.isAnimationEnabled);
    } catch (error) {
      logger.e(error);
    }
  }
}
