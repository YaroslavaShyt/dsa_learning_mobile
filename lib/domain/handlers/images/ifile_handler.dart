import 'dart:io';

abstract interface class IFileHandler {
  Future<File?> pickImageFromGallery({int imageQuality});
}
