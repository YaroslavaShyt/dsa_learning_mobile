abstract interface class IVibrationHandler {
  void vibrate({
    required bool repeat,
    int? duration,
  });

  void vibratePositive();

  void vibrateNegative();
}
