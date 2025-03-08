import 'dart:io';
import 'package:dsa_learning/domain/handlers/images/ifile_handler.dart';
import 'package:image_picker/image_picker.dart';

class FileHandler implements IFileHandler {
  final ImagePicker _imagePicker = ImagePicker();

  @override
  Future<File?> pickImageFromGallery({int imageQuality = 40}) async {
    final XFile? image = await _imagePicker.pickImage(
      source: ImageSource.gallery,
      imageQuality: imageQuality,
    );
    return image != null ? File(image.path) : null;
  }
}
