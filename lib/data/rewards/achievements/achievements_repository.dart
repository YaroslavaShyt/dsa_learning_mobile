import 'package:dio/dio.dart';
import 'package:dsa_learning/core/utils/parsers/background_parser.dart';
import 'package:dsa_learning/data/networking/endpoints.dart';
import 'package:dsa_learning/data/rewards/achievements/achievement.dart';
import 'package:dsa_learning/data/rewards/achievements/streak.dart';
import 'package:dsa_learning/domain/networking/inetworking_client.dart';
import 'package:dsa_learning/domain/rewards/achievements/iachievement.dart';
import 'package:dsa_learning/domain/rewards/achievements/iachievements_repository.dart';
import 'package:dsa_learning/domain/rewards/achievements/istreak.dart';

class AchievementsRepository implements IAchievementsRepository {
  AchievementsRepository({
    required IBackgroundParser backgroundParser,
    required INetworkingClient networkingClient,
  })  : _backgroundParser = backgroundParser,
        _networkingClient = networkingClient;

  final IBackgroundParser _backgroundParser;
  final INetworkingClient _networkingClient;

  @override
  Future<void> addNewAchievement({
    required List<String> achievementId,
  }) async {
    try {
      final Response? response = await _networkingClient.post(
        Endpoints.addNewAchievementEndpoint,
        body: {
          'ids': achievementId,
        },
      );

      if (response == null || response.statusCode == 200) return;

      throw (Exception("Error adding achievement"));
    } catch (error) {
      rethrow;
    }
  }

  @override
  Future<List<IAchievement>> getAllAchievements() async {
    try {
      final Response? response = await _networkingClient.get(
        Endpoints.getAllAchievementsEndpoint,
      );

      if (response == null) return [];

      if (response.statusCode == 200) {
        final List<dynamic> data =
            response.data.map((element) => Map.of(element)).toList();

        final List<Future<IAchievement>> achievements = data.map(
          (achievement) {
            return _backgroundParser.parse<IAchievement>(
              parseFunction: Achievement.fromJson,
              data: achievement,
            );
          },
        ).toList();

        return await Future.wait(achievements);
      }

      throw (Exception("Error adding achievement"));
    } catch (error) {
      rethrow;
    }
  }

  @override
  Future<List<IAchievement>> getUserAchievements() async {
    try {
      final Response? response = await _networkingClient.get(
        Endpoints.userAchievementsEndpoint,
      );

      if (response == null) return [];

      if (response.statusCode == 200) {
        final List<dynamic> data =
            response.data.map((element) => Map.of(element)).toList();

        final List<Future<IAchievement>> achievements = data.map(
          (achievement) {
            return _backgroundParser.parse<IAchievement>(
              parseFunction: Achievement.fromJson,
              data: achievement,
            );
          },
        ).toList();

        return await Future.wait(achievements);
      }
    } catch (error) {
      rethrow;
    }
    return [];
  }

  @override
  Future<List<IStreak>> getUserStreak() async {
    try {
      final Response? response = await _networkingClient.get(
        Endpoints.userStreakEndpoint,
      );

      if (response == null) return [];

      if (response.statusCode == 200) {
        final List<dynamic> data = response.data
            .map(
              (element) => Map.of(element),
            )
            .toList();

        final List<Future<IStreak>> streak = data.map(
          (streak) {
            return _backgroundParser.parse<IStreak>(
              parseFunction: Streak.fromJson,
              data: streak,
            );
          },
        ).toList();
        return await Future.wait(streak);
      }
    } catch (error) {
      rethrow;
    }
    return [];
  }

  @override
  Future<void> updateUserStreak(StreakStatus status, [DateTime? date]) async {
    try {
      final Response? response = await _networkingClient.post(
        Endpoints.updateUserStreakEndpoint,
        body: {
          "status": status.name.toUpperCase(),
          if (date != null) "date": date.toIso8601String()
        },
      );
    } catch (error) {
      rethrow;
    }
  }
}
