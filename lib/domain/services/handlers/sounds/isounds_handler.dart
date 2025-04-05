abstract interface class ISoundsHandler {
  Future<void> playSound(String soundPath, {bool loop = false});

  Future<void> pauseSound();

  Future<void> stopSound();

  Future<void> dispose();

  bool get isPlaying;
}
