import 'dart:io';

import 'package:dsa_learning/domain/handlers/images/icamera_handler.dart';
import 'package:image_picker/image_picker.dart';

class CameraHandler implements ICameraHandler {
  final ImagePicker _imagePicker = ImagePicker();

  @override
  Future<File?> takePhoto() async {
    final XFile? file = await _imagePicker.pickImage(
      source: ImageSource.camera,
    );
    return file != null ? File(file.path) : null;
  }
}
