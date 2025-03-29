import 'package:dsa_learning/core/utils/logging/logger.dart';
import 'package:dsa_learning/domain/lesson/ilesson_repository.dart';
import 'package:dsa_learning/domain/services/lesson/ilesson_service.dart';

class LessonService implements ILessonService {
  LessonService({
    required ILessonRepository lessonRepository,
  }) : _lessonRepository = lessonRepository;

  final ILessonRepository _lessonRepository;

  @override
  Set<int> get learnedLessonsId => _learnedLessonsId;
  Set<int> _learnedLessonsId = {};

  @override
  Future<void> init() async {
    try {
      _learnedLessonsId = await _lessonRepository.getLearnedLessonsIds();
    } catch (error) {
      logger.e(error);
    }
  }

  @override
  Future<void> updateLearnedLessons(int id) async {
    try {
      _learnedLessonsId.add(id);
      _lessonRepository.completeLesson(id);
    } catch (error) {
      logger.e(error);
    }
  }

  @override
  bool isLessonLearned(int id) {
    return _learnedLessonsId.contains(id);
  }
}
