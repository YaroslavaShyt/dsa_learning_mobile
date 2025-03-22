import 'package:dsa_learning/domain/category/icategory.dart';
import 'package:dsa_learning/domain/theory/ilesson_theory.dart';

abstract interface class ILessonRepository {
  Future<List<ICategory>> getLessonsSummary();

  Future<ILessonTheory?> getLessonTheory(int id);
}
