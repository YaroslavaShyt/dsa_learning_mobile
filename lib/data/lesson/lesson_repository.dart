import 'package:dio/dio.dart';
import 'package:dsa_learning/core/utils/logging/logger.dart';
import 'package:dsa_learning/data/category/category.dart';
import 'package:dsa_learning/data/game/game.dart';
import 'package:dsa_learning/data/lesson/lesson.dart';
import 'package:dsa_learning/data/networking/endpoints.dart';
import 'package:dsa_learning/data/theory/lesson_theory.dart';
import 'package:dsa_learning/data/topic/topic.dart';
import 'package:dsa_learning/domain/category/icategory.dart';
import 'package:dsa_learning/domain/game/igame.dart';
import 'package:dsa_learning/domain/lesson/ilesson.dart';
import 'package:dsa_learning/domain/lesson/ilesson_repository.dart';
import 'package:dsa_learning/domain/networking/inetworking_client.dart';
import 'package:dsa_learning/domain/theory/ilesson_theory.dart';
import 'package:dsa_learning/domain/topic/itopic.dart';

part 'lesson_repo_parser.dart';

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

  @override
  Future<ILessonTheory?> getLessonTheory(int id) async {
    try {
      final Response? response = await _networkingClient.get(
        Endpoints.getLessonTheory(id),
      );

      if (response == null) return null;

      return LessonTheory.fromJson(response.data);
    } catch (error) {
      logger.e(error);
    }
    return null;
  }

  @override
  Future<IGame?> getLessonGame(int id) async {
    try {
      final Response? response = await _networkingClient.get(
        Endpoints.getLessonGame(id),
      );

      if (response == null) return null;

      return Game.fromJson(response.data);
    } catch (error) {
      logger.e(error);
    }
    return null;
  }

  @override
  Future<Map<String, List<int>>> getLearnedLessonsIds() async {
    try {
      final Response? response = await _networkingClient.get(
        Endpoints.getLearnedLessonsEndpoint,
      );

      if (response == null || response.data == null) return {};

      if (response.data is Map<String, dynamic>) {
        final Map<String, List<int>> parsedData = {};
        response.data.forEach((key, value) {
          if (value is List) {
            parsedData[key] =
                List<int>.from(value.map((e) => e is int ? e : 0));
          }
        });
        return parsedData;
      }

      return {};
    } catch (error) {
      rethrow;
    }
  }

  @override
  Future<void> completeLesson(int id, int time) async {
    try {
      await _networkingClient
          .post(Endpoints.finishLessonEndpoint, queryParameters: {
        'training-id': id,
      }, body: {
        'time': time.toString(),
      });
    } catch (error) {
      rethrow;
    }
  }
}
