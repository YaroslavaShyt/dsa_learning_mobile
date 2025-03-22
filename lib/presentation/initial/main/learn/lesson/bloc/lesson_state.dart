import 'package:dsa_learning/domain/theory/ilesson_theory.dart';
import 'package:equatable/equatable.dart';

enum LessonStatus { loading, loaded, failure }

class LessonState extends Equatable {
  const LessonState({
    this.step = 1,
    this.status = LessonStatus.loading,
    this.lessonTheory,
    this.progress = 0.0,
  });

  LessonState copyWith({
    int? step,
    LessonStatus? status,
    ILessonTheory? lessonTheory,
    double? progress,
  }) {
    return LessonState(
      step: step ?? this.step,
      status: status ?? this.status,
      progress: progress ?? this.progress,
      lessonTheory: lessonTheory ?? this.lessonTheory,
    );
  }

  final int step;
  final LessonStatus status;
  final ILessonTheory? lessonTheory;
  final double progress;

  @override
  List<Object?> get props => [
        step,
        status,
        lessonTheory,
        progress,
      ];
}
