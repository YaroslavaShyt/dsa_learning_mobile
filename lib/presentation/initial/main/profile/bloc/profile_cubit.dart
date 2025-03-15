import 'dart:io';

import 'package:dsa_learning/core/navigation/inavigation_util.dart';
import 'package:dsa_learning/core/utils/logging/logger.dart';
import 'package:dsa_learning/domain/handlers/images/iselect_image_handler.dart';
import 'package:dsa_learning/domain/services/user/iuser_service.dart';
import 'package:dsa_learning/domain/storage/ilocal_storage.dart';
import 'package:dsa_learning/presentation/initial/main/profile/bloc/profile_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

const String _avatarKey = 'avatar';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit({
    required ILocalStorage localStorage,
    required ISelectImageHandler selectImageHandler,
    required INavigationUtil navigationUtil,
    required IUserService userService,
  })  : _localStorage = localStorage,
        _selectImageHandler = selectImageHandler,
        _navigationUtil = navigationUtil,
        _userService = userService,
        super(const ProfileState());

  final ILocalStorage _localStorage;
  final ISelectImageHandler _selectImageHandler;
  final INavigationUtil _navigationUtil;
  final IUserService _userService;

  String get userName => _userService.user?.firstName ?? 'user';

  Future<void> init() async {
    try {
      final String profilePhoto = _userService.user?.profilePhoto ?? '';
      emit(state.copyWith(profilePhoto: File(profilePhoto).path));
    } catch (error) {
      logger.e(error);
    }
  }

  Future<void> onAddAvatarFromCameraTapped() async {
    try {
      final File? file = await _selectImageHandler.takePhotoFromCamera(
        onPermanentlyDenied: () {},
        onFirstlyDenied: () {},
      );
      if (file != null) {
        emit(state.copyWith(profilePhoto: file.path));
        _localStorage.create(key: _avatarKey, value: file.path);
        _userService.updateUser(profilePhoto: file.path);
        _navigationUtil.navigateBack();
      }
    } catch (error) {
      logger.e(error);
    }
  }

  Future<void> onAddAvatarFromGalleryTapped() async {
    try {
      final File? file = await _selectImageHandler.selectImageFromGallery(
        onPermanentlyDenied: () {},
        onFirstlyDenied: () {},
      );
      if (file != null) {
        emit(state.copyWith(profilePhoto: file.path));
        _localStorage.create(key: _avatarKey, value: file.path);
        _userService.updateUser(profilePhoto: file.path);
        _navigationUtil.navigateBack();
      }
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
    await _userService.cleanUserData();
  }

  void onCancelTap() {
    _navigationUtil.navigateBack();
  }
}
