import 'dart:io';

abstract interface class ICameraHandler {
  Future<File?> takePhoto();
}
