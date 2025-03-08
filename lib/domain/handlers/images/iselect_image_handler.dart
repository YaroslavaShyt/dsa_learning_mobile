import 'dart:io';
import 'dart:ui';

abstract interface class ISelectImageHandler {
  Future<File?> selectImageFromGallery({
    required VoidCallback onPermanentlyDenied,
    required VoidCallback onFirstlyDenied,
  });

  Future<File?> takePhotoFromCamera({
    required VoidCallback onPermanentlyDenied,
    required VoidCallback onFirstlyDenied,
  });
}
