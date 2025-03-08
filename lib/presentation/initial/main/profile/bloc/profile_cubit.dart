import 'dart:io';

import 'package:dsa_learning/core/navigation/inavigation_util.dart';
import 'package:dsa_learning/core/utils/logging/logger.dart';
import 'package:dsa_learning/domain/handlers/images/iselect_image_handler.dart';
import 'package:dsa_learning/domain/storage/ilocal_storage.dart';
import 'package:dsa_learning/presentation/initial/main/profile/bloc/profile_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

const String _avatarKey = 'avatar';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit({
    required ILocalStorage localStorage,
    required ISelectImageHandler selectImageHandler,
    required INavigationUtil navigationUtil,
  })  : _localStorage = localStorage,
        _selectImageHandler = selectImageHandler,
        _navigationUtil = navigationUtil,
        super(const ProfileState());

  final ILocalStorage _localStorage;
  final ISelectImageHandler _selectImageHandler;
  final INavigationUtil _navigationUtil;

  Future<void> init() async {
    try {
      final String? profilePhoto = await _localStorage.read(key: _avatarKey);
      if (profilePhoto != null) {
        emit(state.copyWith(profilePhoto: File(profilePhoto).path));
      }
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
        _navigationUtil.navigateBack();
      }
    } catch (error) {
      logger.e(error);
    }
  }
}
