import 'package:dsa_learning/domain/category/icategory.dart';

abstract interface class ILessonService {
  Future<void> init();

  List<ICategory> get summary;

  Set<int> get learnedAlgorithmsLessonsId;

  Set<int> get learnedDataStructuresLessonsId;

  int get algorithmsLessonsNum;

  int get dataStructuresLessonsNum;

  int get lessonsCounter;

  Future<void> updateLearnedLessons(int id, int time, String category);

  bool isLessonLearned(int id);

  bool isPreviousTopicFinished(int categoryIndex, int topicIndex);

  void resetData();
}
