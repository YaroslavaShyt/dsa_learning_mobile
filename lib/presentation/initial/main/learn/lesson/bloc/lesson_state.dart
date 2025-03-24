import 'package:dsa_learning/domain/game/igame.dart';
import 'package:dsa_learning/domain/theory/ilesson_theory.dart';
import 'package:equatable/equatable.dart';

enum LessonStatus { loading, loaded, failure }

enum ActivityType { theory, game }

class LessonState extends Equatable {
  const LessonState({
    this.step = 1,
    this.status = LessonStatus.loading,
    this.lessonTheory,
    this.game,
    this.progress = 0.0,
    this.theoryTime = 0,
    this.activityType = ActivityType.theory,
  });

  LessonState copyWith({
    int? step,
    LessonStatus? status,
    ILessonTheory? lessonTheory,
    IGame? game,
    double? progress,
    ActivityType? activityType,
    int? theoryTime,
  }) {
    return LessonState(
      step: step ?? this.step,
      game: game ?? this.game,
      status: status ?? this.status,
      progress: progress ?? this.progress,
      theoryTime: theoryTime ?? this.theoryTime,
      activityType: activityType ?? this.activityType,
      lessonTheory: lessonTheory ?? this.lessonTheory,
    );
  }

  final int step;
  final LessonStatus status;
  final ILessonTheory? lessonTheory;
  final IGame? game;
  final double progress;
  final int theoryTime;
  final ActivityType activityType;

  @override
  List<Object?> get props => [
        step,
        game,
        status,
        lessonTheory,
        progress,
        theoryTime,
      ];
}
