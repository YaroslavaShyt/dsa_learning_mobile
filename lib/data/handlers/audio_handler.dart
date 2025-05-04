import 'package:dsa_learning/core/constants/audio_assets.dart';
import 'package:dsa_learning/core/utils/logging/logger.dart';
import 'package:dsa_learning/domain/handlers/iaudio_handler.dart';
import 'package:just_audio/just_audio.dart';

class AudioHandler implements IAudioHandler {
  final AudioPlayer _player = AudioPlayer();

  @override
  Future<void> initButtonAudio() async {
    try {
      await _player.setAudioSource(
        AudioSource.asset(AudioAssets.button),
      );
    } on PlayerException catch (e) {
      logger.e(e);
    }
  }

  @override
  Future<void> playButtonSound({required bool isAudioOn}) async {
    if (!isAudioOn) return;
    await _player.seek(Duration.zero);

    await _player.play();
  }
}
