import 'dart:io';
import 'dart:typed_data';

import 'package:dsa_learning/domain/handlers/images/iprocess_image_handler.dart';
import 'package:image/image.dart' as img;

const int _compressedImageWidth = 1280;
const int _compressedImageQuality = 80;

class ProcessImageHandler implements IProcessImageHandler {
  @override
  Future<Uint8List?> processImageForOfflineStorage({required File file}) async {
    Uint8List? smallerCopy;

    final img.Image? byteImage = await _getByteImage(image: file);
    if (byteImage != null) {
      smallerCopy = _getResizedCompressedImage(
        image: byteImage,
      );
    }
    return smallerCopy;
  }

  Future<img.Image?> _getByteImage({
    required File image,
  }) async {
    final Uint8List bytes = await image.readAsBytes();
    return img.decodeImage(bytes);
  }

  Uint8List _getResizedCompressedImage({
    required img.Image image,
    int width = _compressedImageWidth,
    int quality = _compressedImageQuality,
  }) {
    final img.Image resizedImage = img.copyResize(
      image,
      width: width,
    );
    final Uint8List smallerCopy = Uint8List.fromList(
      img.encodeJpg(
        resizedImage,
        quality: quality,
      ),
    );
    return smallerCopy;
  }
}
