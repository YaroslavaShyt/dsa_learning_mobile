import 'package:dsa_learning/data/lesson/lesson_plan.dart';
import 'package:dsa_learning/domain/lesson/ilesson.dart';
import 'package:dsa_learning/domain/lesson/ilesson_plan.dart';

const String _lessonId = 'lessonId';
const String _lessonTitle = 'lessonTitle';
const String _lessonPlan = 'lessonPlanSteps';

class Lesson implements ILesson {
  Lesson({
    required this.id,
    required this.title,
    required this.plan,
  });

  factory Lesson.fromJson(Map<String, dynamic> data) {
    return Lesson(
      id: data[_lessonId],
      title: data[_lessonTitle],
      plan: LessonPlan.fromJson(
        data[_lessonPlan],
      ),
    );
  }

  @override
  final int id;

  @override
  final String title;

  @override
  final ILessonPlan plan;
}
