abstract interface class ILessonService {
  Future<void> init();

  Set<int> get learnedAlgorithmsLessonsId;

  Set<int> get learnedDataStructuresLessonsId;

  Future<void> updateLearnedLessons(int id, int time, String category);

  bool isLessonLearned(int id);

  int get algorithmsLessonsNum;

  int get dataStructuresLessonsNum;

  int get lessonsCounter;

}
