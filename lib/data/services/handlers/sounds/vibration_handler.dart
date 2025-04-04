import 'package:dsa_learning/domain/services/handlers/sounds/isounds_handler.dart';
import 'package:vibration/vibration.dart';

const int _defaultVibrationDuration = 500;

class VibrationHandler implements IVibrationHandler {
  @override
  void vibrate({
    required bool repeat,
    int? duration,
  }) {
    Vibration.vibrate(
      duration: duration ?? _defaultVibrationDuration,
      repeat: repeat ? 1 : -1,
    );
  }

  @override
  void vibratePositive() {
    Vibration.vibrate(
      duration: 200,
    );
  }

  @override
  void vibrateNegative() {
    Vibration.vibrate(
      pattern: [
        0,
        300,
        100,
        300,
      ],
      intensities: [0, 128, 0, 255, 0, 64, 0, 255],
    );
  }
}
