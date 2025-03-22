import 'package:dsa_learning/domain/lesson/ilesson_plan.dart';
import 'package:dsa_learning/domain/theory/itheory.dart';

abstract interface class ILessonTheory {
  ILessonTheory({
    required this.lessonTitle,
    required this.lessonPlan,
    required this.lessonTheory,
  });

  final String lessonTitle;
  final ILessonPlan lessonPlan;
  final ITheory lessonTheory;
}
