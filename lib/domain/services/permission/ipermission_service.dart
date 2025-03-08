import 'package:permission_handler/permission_handler.dart';

abstract interface class IPermissionService {
  Future<bool> get isNotificationPermissionAskedPreviously;

  Future<bool> get isCameraPermissionAskedPreviously;

  Future<bool> get isCameraPermissionGranted;

  Future<bool> get isMediaLibraryPermissionAskedPreviously;

  Future<bool> get isMediaLibraryPermissionGranted;

  Future<bool> get isFilesAccessPermissionAskedPreviously;

  Future<bool> get isFilesAccessPermissionGranted;

  Future<void> setIsCameraPermissionAskedPreviously({
    required bool isAsked,
  });

  Future<void> setIsCameraPermissionGranted({
    required bool isGranted,
  });

  Future<void> setIsMediaLibraryPermissionAskedPreviously({
    required bool isAsked,
  });

  Future<void> setIsMediaLibraryPermissionGranted({
    required bool isGranted,
  });

  Future<void> setIsFilesAccessPermissionAskedPreviously({
    required bool isAsked,
  });

  Future<void> setIsFilesAccessPermissionGranted({
    required bool isGranted,
  });

  Future<void> setIsNotificationsAccessPermissionAskedPreviously({
    required bool isAsked,
  });

  Future<PermissionStatus> get cameraStatus;

  Future<PermissionStatus> get mediaLibraryStatus;

  Future<bool> askCorePermissions();

  Future<PermissionStatus> askCameraPermission();

  Future<PermissionStatus> askMediaLibraryPermission();

  Future<PermissionStatus> askFilesAccessPermission();

  Future<bool> isNotificationsGranted();
}
