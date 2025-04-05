// import 'package:flutter_sound/flutter_sound.dart';
//
// class SoundsHandler {
//   FlutterSoundPlayer? _player = FlutterSoundPlayer();
//   bool _isInitialized = false;
//
//   void initPlayer() {
//     _player!.openPlayer().then(
//       (value) {
//         _isInitialized = true;
//       },
//     );
//   }
//
//   Future<void> play(String path) async {
//     await _player!.startPlayer(
//         fromDataBuffer: path,
//         codec: Codec.mp3,
//         whenFinished: () {
//           setState(() {});
//         });
//   }
//
//   void closePlayer() {
//     _player?.closePlayer();
//     _player = null;
//   }
// }
