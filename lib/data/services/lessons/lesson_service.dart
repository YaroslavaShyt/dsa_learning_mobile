import 'package:dsa_learning/core/utils/logging/logger.dart';
import 'package:dsa_learning/domain/category/icategory.dart';
import 'package:dsa_learning/domain/lesson/ilesson_repository.dart';
import 'package:dsa_learning/domain/services/lesson/ilesson_service.dart';

const String _algorithms = "ALGORITHMS";
const String _dataStructures = "DATA_STRUCTURES";

class LessonService implements ILessonService {
  LessonService({
    required ILessonRepository lessonRepository,
  }) : _lessonRepository = lessonRepository;

  final ILessonRepository _lessonRepository;

  @override
  List<ICategory> get summary => _summary;
  List<ICategory> _summary = [];

  @override
  int get algorithmsLessonsNum => _algorithmsLessonsNum;
  int _algorithmsLessonsNum = 0;

  int _countAlgorithmsLessons() {
    int sum = 0;
    for (var i in _summary.last.topics) {
      sum += i.lessons.length;
    }
    return sum;
  }

  int _countDataStructuresLessons() {
    int sum = 0;
    for (var i in _summary.first.topics) {
      sum += i.lessons.length;
    }
    return sum;
  }

  @override
  bool isPreviousTopicFinished(int categoryIndex, int topicIndex) {
    final List<int> topicLessonsIds = _summary[categoryIndex]
        .topics[topicIndex]
        .lessons
        .map<int>((lesson) => lesson.id)
        .toList();
    if (categoryIndex == 0) {
      for (var id in topicLessonsIds) {
        if (!_learnedDataStructuresLessonsId.contains(id)) return false;
      }
    } else {
      for (var id in topicLessonsIds) {
        if (!_learnedAlgorithmsLessonsId.contains(id)) return false;
      }
    }
    return true;
  }

  @override
  int get dataStructuresLessonsNum => _dataStructuresLessonsNum;
  int _dataStructuresLessonsNum = 0;

  @override
  Future<void> init() async {
    try {
      _summary = await _lessonRepository.getLessonsSummary();
      _summary.first.topics.sort((a, b) => a.id.compareTo(b.id));
      _summary.last.topics.sort((a, b) => a.id.compareTo(b.id));

      _algorithmsLessonsNum = _countAlgorithmsLessons();
      _dataStructuresLessonsNum = _countDataStructuresLessons();

      final data = await _lessonRepository.getLearnedLessonsIds();
      _learnedDataStructuresLessonsId = data[_dataStructures]?.toSet() ?? {};
      _learnedAlgorithmsLessonsId = data[_algorithms]?.toSet() ?? {};
    } catch (error) {
      logger.e(error);
    }
  }

  @override
  Future<void> updateLearnedLessons(int id, int time, String category) async {
    try {
      _lessonRepository.completeLesson(id, time);

      _lessonsCounter += 1;
      if (category == _algorithms) {
        _learnedAlgorithmsLessonsId.add(id);
      }
      if (category == _dataStructures) {
        _learnedDataStructuresLessonsId.add(id);
      }
    } catch (error) {
      logger.e(error);
    }
  }

  @override
  bool isLessonLearned(int id) {
    return _learnedAlgorithmsLessonsId.contains(id) ||
        _learnedDataStructuresLessonsId.contains(id);
  }

  @override
  Set<int> get learnedAlgorithmsLessonsId => _learnedAlgorithmsLessonsId;
  Set<int> _learnedAlgorithmsLessonsId = {};

  @override
  Set<int> get learnedDataStructuresLessonsId =>
      _learnedDataStructuresLessonsId;
  Set<int> _learnedDataStructuresLessonsId = {};

  @override
  int get lessonsCounter => _lessonsCounter;
  int _lessonsCounter = 0;

  @override
  void resetData() {
    _lessonsCounter = 0;
    _dataStructuresLessonsNum = 0;
    _algorithmsLessonsNum = 0;
    _summary = [];
    _learnedDataStructuresLessonsId = {};
    _learnedAlgorithmsLessonsId = {};
  }
}
