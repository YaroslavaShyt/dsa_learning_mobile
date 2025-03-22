import 'package:dio/dio.dart';
import 'package:dsa_learning/core/utils/logging/logger.dart';
import 'package:dsa_learning/data/category/category.dart';
import 'package:dsa_learning/data/lesson/lesson.dart';
import 'package:dsa_learning/data/networking/endpoints.dart';
import 'package:dsa_learning/data/topic/topic.dart';
import 'package:dsa_learning/domain/category/icategory.dart';
import 'package:dsa_learning/domain/lesson/ilesson.dart';
import 'package:dsa_learning/domain/lesson/ilesson_repository.dart';
import 'package:dsa_learning/domain/networking/inetworking_client.dart';
import 'package:dsa_learning/domain/topic/itopic.dart';

class LessonRepository implements ILessonRepository {
  LessonRepository({
    required INetworkingClient networkingClient,
  }) : _networkingClient = networkingClient;

  final INetworkingClient _networkingClient;

  @override
  Future<List<ICategory>> getLessonsSummary() async {
    try {
      final Response? response = await _networkingClient.get(
        Endpoints.getLessonSummaryEndpoint,
      );

      if (response == null) return [];
      return response.data.keys.map<ICategory>(
        (String category) {
          return _createCategory(category, response.data[category]);
        },
      ).toList();
    } catch (error) {
      logger.e(error);
    }
    return [];
  }

  ITopic _createTopic(String topic, List lessonData) {
    return Topic(
      title: topic,
      lessons: _createLessons(lessonData),
    );
  }

  List<ILesson> _createLessons(List lessonData) {
    return lessonData.map(
      (lesson) {
        return Lesson.fromJson(lesson);
      },
    ).toList();
  }

  ICategory _createCategory(String category, Map categoryData) {
    return Category(
      title: category,
      topics: _createTopics(categoryData),
    );
  }

  List<ITopic> _createTopics(Map categoryData) {
    return categoryData.keys.map(
      (topic) {
        return _createTopic(topic, categoryData[topic]);
      },
    ).toList();
  }
}
