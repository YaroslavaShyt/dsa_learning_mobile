abstract interface class IAudioHandler {
  Future<void> playButtonSound({
    required bool isAudioOn,
  });

  Future<void> initButtonAudio();
}
