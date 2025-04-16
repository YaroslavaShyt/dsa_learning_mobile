abstract interface class IAudioHandler {
  Future<void> playButtonSound(bool isAudioOn);

  Future<void> initButtonAudio();
}
