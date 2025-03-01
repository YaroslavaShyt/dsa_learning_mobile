import 'package:dio/dio.dart';
import 'package:dsa_learning/core/utils/parsers/background_parser.dart';
import 'package:dsa_learning/data/networking/endpoints.dart';
import 'package:dsa_learning/domain/achievements/iachievement.dart';
import 'package:dsa_learning/domain/achievements/iachievements_repository.dart';
import 'package:dsa_learning/domain/achievements/istreak.dart';
import 'package:dsa_learning/domain/networking/inetworking_client.dart';

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
    required String achievementId,
    required String userId,
  }) async {
    try {
      final Response? response = await _networkingClient.post(
        Endpoints.addNewAchievementEndpoint(
          userId: userId,
          achievementId: achievementId,
        ),
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
      final Response? response = await _networkingClient.post(
        Endpoints.getAllAchievementsEndpoint,
      );

      if (response?.statusCode == 200) {}

      throw (Exception("Error adding achievement"));
    } catch (error) {
      rethrow;
    }
  }

  @override
  Future<List<IAchievement>> getUserAchievements() {
    // TODO: implement getUserAchievements
    throw UnimplementedError();
  }

  @override
  Future<List<IStreak>> getUserStreak() {
    // TODO: implement getUserStreak
    throw UnimplementedError();
  }
}
