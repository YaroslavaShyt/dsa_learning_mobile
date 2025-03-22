import 'package:dsa_learning/domain/theory/ilesson_theory.dart';
import 'package:equatable/equatable.dart';

enum LessonStatus { loading, loaded, failure }

class LessonState extends Equatable {
  const LessonState({
    this.step = 1,
    this.status = LessonStatus.loading,
    this.lessonTheory,
  });

  LessonState copyWith({
    int? step,
    LessonStatus? status,
    ILessonTheory? lessonTheory,
  }) {
    return LessonState(
      step: step ?? this.step,
      status: status ?? this.status,
      lessonTheory: lessonTheory ?? this.lessonTheory,
    );
  }

  final int step;
  final LessonStatus status;
  final ILessonTheory? lessonTheory;

  @override
  List<Object?> get props => [
        step,
        status,
        lessonTheory,
      ];
}
