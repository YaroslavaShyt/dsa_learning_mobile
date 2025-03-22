import 'package:dsa_learning/domain/lesson/ilesson_plan.dart';

abstract interface class ILesson {
  ILesson({
    required this.id,
    required this.title,
    required this.plan,
  });

  final int id;
  final String title;
  final ILessonPlan plan;
}
