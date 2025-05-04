import 'package:dsa_learning/domain/handlers/iaudio_handler.dart';
import 'package:dsa_learning/main.dart';

mixin SoundMixin {
  final IAudioHandler _audioHandler = sl.get<IAudioHandler>();

  void sound({
    required bool isEnabled,
  }) {
    _audioHandler.playButtonSound(isAudioOn: isEnabled);
  }
}
