abstract interface class ILessonService {
  Future<void> init();

  Set<int> get learnedLessonsId;

  Future<void> updateLearnedLessons(int id);

  bool isLessonLearned(int id);
}
