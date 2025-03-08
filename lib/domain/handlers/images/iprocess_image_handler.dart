import 'dart:io';
import 'dart:typed_data';

abstract interface class IProcessImageHandler {
  Future<Uint8List?> processImageForOfflineStorage({
    required File file,
  });
}
