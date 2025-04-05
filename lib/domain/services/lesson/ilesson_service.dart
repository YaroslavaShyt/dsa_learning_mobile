abstract interface class ILessonService {
  Future<void> init();

  Set<int> get learnedLessonsId;

  Future<void> updateLearnedLessons(int id, int time);

  bool isLessonLearned(int id);
}
