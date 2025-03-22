import 'package:dsa_learning/domain/category/icategory.dart';

abstract interface class ILessonRepository {
  Future<List<ICategory>> getLessonsSummary();
}
