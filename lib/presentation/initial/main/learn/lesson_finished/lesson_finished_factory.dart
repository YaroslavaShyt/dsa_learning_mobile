import 'package:dsa_learning/data/rewards/achievements/achievement.dart';
import 'package:dsa_learning/presentation/initial/main/learn/lesson_finished/lesson_finished_screen.dart';
import 'package:flutter/material.dart';

class LessonFinishedRoutingArgs {
  LessonFinishedRoutingArgs({
    required this.isAudioEnabled,
    required this.isVibrationEnabled,
    required this.playSound,
    required this.vibrate,
    required this.onToLessonsPressed,
    required this.time,
    required this.lessonName,
    required this.lessonDescription,
    required this.isLessonOver,
    required this.isGame,
    required this.bytes,
    required this.hash,
    required this.fan,
    required this.achievements,
  });

  final bool isAudioEnabled;
  final VoidCallback vibrate;
  final VoidCallback playSound;
  final bool isVibrationEnabled;
  final String time;
  final String lessonName;
  final String lessonDescription;
  final bool isGame;
  final bool isLessonOver;
  final int bytes;
  final int hash;
  final int fan;
  final List<AchievementType> achievements;
  final VoidCallback onToLessonsPressed;
}

class LessonFinishedFactory {
  static Widget build(LessonFinishedRoutingArgs args) {
    return LessonFinishedScreen(
      isAudioEnabled: args.isAudioEnabled,
      isVibrationEnabled: args.isVibrationEnabled,
      vibrate: args.vibrate,
      playSound: args.playSound,
      args: args,
    );
  }
}
