import 'package:dsa_learning/domain/category/icategory.dart';
import 'package:dsa_learning/domain/game/igame.dart';
import 'package:dsa_learning/domain/theory/ilesson_theory.dart';

abstract interface class ILessonRepository {
  Future<List<ICategory>> getLessonsSummary();

  Future<ILessonTheory?> getLessonTheory(int id);

  Future<IGame?> getLessonGame(int id);

  Future<Map<String, List<int>>> getLearnedLessonsIds();

  Future<void> completeLesson(int id, int time);
}
