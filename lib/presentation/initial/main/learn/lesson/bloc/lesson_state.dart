import 'package:dsa_learning/domain/game/igame.dart';
import 'package:dsa_learning/domain/theory/ilesson_theory.dart';
import 'package:equatable/equatable.dart';

enum LessonStatus { loading, loaded, failure }

enum ActivityType { theory, game }

class LessonState extends Equatable {
  const LessonState({
    this.step = 1,
    this.gameStep = 0,
    this.gameTime = 0,
    this.status = LessonStatus.loading,
    this.lessonTheory,
    this.game,
    this.progress = 0.0,
    this.theoryTime = 0,
    this.activityType = ActivityType.theory,
    this.selectedAnswer = '',
    this.gameCorrectAnswers = 0,
    this.gameProgress = const [],
    this.vents = 0,
  });

  LessonState copyWith({
    int? step,
    LessonStatus? status,
    ILessonTheory? lessonTheory,
    IGame? game,
    double? progress,
    int? gameTime,
    ActivityType? activityType,
    int? theoryTime,
    int? gameStep,
    String? selectedAnswer,
    int? gameCorrectAnswers,
    List<bool>? gameProgress,
    int? vents,
  }) {
    return LessonState(
      step: step ?? this.step,
      game: game ?? this.game,
      status: status ?? this.status,
      gameTime: gameTime ?? this.gameTime,
      progress: progress ?? this.progress,
      gameStep: gameStep ?? this.gameStep,
      selectedAnswer: selectedAnswer ?? this.selectedAnswer,
      theoryTime: theoryTime ?? this.theoryTime,
      activityType: activityType ?? this.activityType,
      lessonTheory: lessonTheory ?? this.lessonTheory,
      gameProgress: gameProgress ?? this.gameProgress,
      gameCorrectAnswers: gameCorrectAnswers ?? this.gameCorrectAnswers,
      vents: vents ?? this.vents,
    );
  }

  final int step;
  final int gameStep;
  final LessonStatus status;
  final ILessonTheory? lessonTheory;
  final IGame? game;
  final double progress;
  final int theoryTime;
  final int gameTime;
  final ActivityType activityType;
  final String selectedAnswer;
  final int gameCorrectAnswers;
  final List<bool> gameProgress;
  final int vents;

  @override
  List<Object?> get props => [
        step,
        game,
        status,
        lessonTheory,
        progress,
        theoryTime,
        activityType,
        gameStep,
        gameTime,
        selectedAnswer,
        gameCorrectAnswers,
        gameProgress,
        vents,
      ];
}
