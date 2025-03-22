import 'package:dsa_learning/domain/category/icategory.dart';
import 'package:equatable/equatable.dart';

enum LearnStatus { loading, loaded, failure }

class LearnState extends Equatable {
  const LearnState({
    this.status = LearnStatus.loading,
    this.lessonsSummary = const [],
  });

  LearnState copyWith({
    LearnStatus? status,
    List<ICategory>? lessonsSummary,
  }) {
    return LearnState(
      status: status ?? this.status,
      lessonsSummary: lessonsSummary ?? this.lessonsSummary,
    );
  }

  final LearnStatus status;
  final List<ICategory> lessonsSummary;

  @override
  List<Object?> get props => [
        status,
        lessonsSummary,
      ];
}
