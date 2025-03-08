import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:dsa_learning/domain/services/permission/ipermission_service.dart';
import 'package:dsa_learning/domain/storage/ilocal_storage.dart';
import 'package:permission_handler/permission_handler.dart';

const int android_13 = 33;
const int android_12 = 32;
const int android_11 = 11;

const String _cameraPermissionValue = 'is_camera_permission_asked';
const String _cameraPermissionStatus = 'is_camera_permission_granted';
const String _mediaLibraryPermissionValue = 'is_media_library_permission_asked';
const String _mediaLibraryPermissionStatus =
    'is_media_library_permission_granted';
const String _notificationsPermissionValue =
    'is_notifications_permission_asked';
const String _filesAccessPermissionValue = 'is_files_access_permission_asked';
const String _filesAccessPermissionStatus =
    'is_files_access_permission_granted';

class PermissionService implements IPermissionService {
  PermissionService({
    required DeviceInfoPlugin deviceInfoPlugin,
    required ILocalStorage localStorage,
  })  : _localStorage = localStorage,
        _deviceInfoPlugin = deviceInfoPlugin;

  final DeviceInfoPlugin _deviceInfoPlugin;
  final ILocalStorage _localStorage;

  @override
  Future<bool> get isNotificationPermissionAskedPreviously async =>
      await _localStorage.read(key: _notificationsPermissionValue) ?? false;

  @override
  Future<bool> get isCameraPermissionAskedPreviously async =>
      await _localStorage.read(key: _cameraPermissionValue) ?? false;

  @override
  Future<bool> get isCameraPermissionGranted async =>
      await _localStorage.read(key: _cameraPermissionStatus) ?? false;

  @override
  Future<bool> get isMediaLibraryPermissionAskedPreviously async =>
      await _localStorage.read(key: _mediaLibraryPermissionValue) ?? false;

  @override
  Future<bool> get isMediaLibraryPermissionGranted async =>
      await _localStorage.read(key: _mediaLibraryPermissionStatus) ?? false;

  @override
  Future<bool> get isFilesAccessPermissionAskedPreviously async =>
      await _localStorage.read(key: _filesAccessPermissionValue) ?? false;

  @override
  Future<bool> get isFilesAccessPermissionGranted async =>
      await _localStorage.read(key: _filesAccessPermissionStatus) ?? false;

  @override
  Future<void> setIsCameraPermissionAskedPreviously({
    required bool isAsked,
  }) async {
    await _localStorage.update(key: _cameraPermissionValue, value: isAsked);
  }

  @override
  Future<void> setIsCameraPermissionGranted({
    required bool isGranted,
  }) async {
    await _localStorage.update(key: _cameraPermissionStatus, value: isGranted);
  }

  @override
  Future<void> setIsMediaLibraryPermissionAskedPreviously({
    required bool isAsked,
  }) async {
    await _localStorage.update(
        key: _mediaLibraryPermissionValue, value: isAsked);
  }

  @override
  Future<void> setIsMediaLibraryPermissionGranted({
    required bool isGranted,
  }) async {
    await _localStorage.update(
        key: _mediaLibraryPermissionStatus, value: isGranted);
  }

  @override
  Future<void> setIsFilesAccessPermissionAskedPreviously({
    required bool isAsked,
  }) async {
    await _localStorage.update(
        key: _filesAccessPermissionValue, value: isAsked);
  }

  @override
  Future<void> setIsFilesAccessPermissionGranted({
    required bool isGranted,
  }) async {
    await _localStorage.update(
        key: _filesAccessPermissionStatus, value: isGranted);
  }

  @override
  Future<void> setIsNotificationsAccessPermissionAskedPreviously({
    required bool isAsked,
  }) async {
    await _localStorage.update(
        key: _notificationsPermissionValue, value: isAsked);
  }

  @override
  Future<PermissionStatus> get cameraStatus => Permission.camera.status;

  @override
  Future<PermissionStatus> get mediaLibraryStatus => Permission.photos.status;

  @override
  Future<bool> askCorePermissions() async {
    final Map<Permission, PermissionStatus> statuses =
        await (await _corePermissions).request();
    await _localStorage.update(key: _notificationsPermissionValue, value: true);
    bool isDenied = false;
    for (var element in statuses.values) {
      isDenied = element.isDenied || element.isPermanentlyDenied;
      if (isDenied) {
        break;
      }
    }
    return !isDenied;
  }

  @override
  Future<PermissionStatus> askCameraPermission() async {
    return Permission.camera.request();
  }

  @override
  Future<PermissionStatus> askMediaLibraryPermission() async {
    if (Platform.isAndroid) {
      final AndroidDeviceInfo androidInfo = await _deviceInfoPlugin.androidInfo;
      if (androidInfo.version.sdkInt <= android_12) {
        return Permission.storage.request();
      } else {
        return Permission.photos.request();
      }
    } else {
      return Permission.photos.request();
    }
  }

  @override
  Future<PermissionStatus> askFilesAccessPermission() async {
    if (Platform.isAndroid) {
      final AndroidDeviceInfo androidInfo = await _deviceInfoPlugin.androidInfo;
      final int sdk = androidInfo.version.sdkInt;
      if (sdk < android_13) {
        return Permission.storage.request();
      }
    }
    return PermissionStatus.granted;
  }

  Future<List<Permission>> get _corePermissions async {
    if (Platform.isAndroid) {
      return _androidCorePermissions();
    } else {
      return _iosCorePermissions();
    }
  }

  Future<List<Permission>> _androidCorePermissions() async {
    final AndroidDeviceInfo androidInfo = await _deviceInfoPlugin.androidInfo;
    final int sdk = androidInfo.version.sdkInt;
    if (sdk >= android_12) {
      return [
        Permission.notification,
      ];
    } else {
      return [
        Permission.notification,
      ];
    }
  }

  Future<List<Permission>> _iosCorePermissions() async {
    return [
      Permission.notification,
    ];
  }

  @override
  Future<bool> isNotificationsGranted() async {
    final List<Permission> permissions = await _corePermissions;
    bool notificationGranted = false;
    for (var element in permissions) {
      if (element == Permission.notification &&
          await element.status.isGranted) {
        notificationGranted = true;
      }
    }
    return notificationGranted;
  }
}
