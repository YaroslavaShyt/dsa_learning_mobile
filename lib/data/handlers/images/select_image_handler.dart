import 'dart:async';
import 'dart:io';
import 'dart:ui';

import 'package:dsa_learning/core/utils/logging/logger.dart';
import 'package:dsa_learning/domain/handlers/images/icamera_handler.dart';
import 'package:dsa_learning/domain/handlers/images/ifile_handler.dart';
import 'package:dsa_learning/domain/handlers/images/iselect_image_handler.dart';
import 'package:dsa_learning/domain/services/permission/ipermission_service.dart';
import 'package:permission_handler/permission_handler.dart';

class SelectImageHandler implements ISelectImageHandler {
  SelectImageHandler({
    required IPermissionService permissionService,
    required ICameraHandler cameraHandler,
    required IFileHandler fileHandler,
  })  : _permissionService = permissionService,
        _cameraHandler = cameraHandler,
        _fileHandler = fileHandler;

  final IFileHandler _fileHandler;
  final ICameraHandler _cameraHandler;
  final IPermissionService _permissionService;

  Future<bool> get _isCameraPermissionAskedPreviously =>
      _permissionService.isCameraPermissionAskedPreviously;

  Future<bool> get _isMediaLibraryPermissionAskedPreviously =>
      _permissionService.isMediaLibraryPermissionAskedPreviously;

  @override
  Future<File?> selectImageFromGallery({
    required VoidCallback onPermanentlyDenied,
    required VoidCallback onFirstlyDenied,
  }) async {
    try {
      final PermissionStatus status =
          await _permissionService.askMediaLibraryPermission();

      if (status.isDenied) {
        onFirstlyDenied();
      }

      if (status.isGranted || status.isLimited) {
        _updatePermissions(isMediaPermissions: true);
        return _fileHandler.pickImageFromGallery();
      }

      if (status.isPermanentlyDenied) {
        if (await _isMediaLibraryPermissionAskedPreviously) {
          onPermanentlyDenied();
        } else {
          onFirstlyDenied();
          _permissionService.setIsMediaLibraryPermissionAskedPreviously(
            isAsked: true,
          );
        }
      }
    } catch (error) {
      logger.e(error);
    }
    return null;
  }

  @override
  Future<File?> takePhotoFromCamera({
    required VoidCallback onPermanentlyDenied,
    required VoidCallback onFirstlyDenied,
  }) async {
    try {
      final PermissionStatus status =
          await _permissionService.askCameraPermission();

      if (status.isDenied) {
        onFirstlyDenied();
      }

      if (status.isGranted) {
        _updatePermissions(isCameraPermissions: true);
        return _cameraHandler.takePhoto();
      }

      if (status.isPermanentlyDenied) {
        if (await _isCameraPermissionAskedPreviously) {
          onPermanentlyDenied();
        } else {
          onFirstlyDenied();
          _permissionService.setIsCameraPermissionAskedPreviously(
            isAsked: true,
          );
        }
      }
    } catch (error) {
      logger.e(error);
    }
    return null;
  }

  void _updatePermissions({
    bool isCameraPermissions = false,
    bool isMediaPermissions = false,
  }) {
    if (isMediaPermissions) {
      _permissionService.setIsMediaLibraryPermissionGranted(isGranted: true);
      _permissionService.setIsMediaLibraryPermissionAskedPreviously(
        isAsked: true,
      );
    }
    if (isCameraPermissions) {
      _permissionService.setIsCameraPermissionGranted(isGranted: true);
      _permissionService.setIsCameraPermissionAskedPreviously(isAsked: true);
    }
  }
}
