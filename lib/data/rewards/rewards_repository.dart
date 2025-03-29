import 'package:dio/dio.dart';
import 'package:dsa_learning/core/utils/logging/logger.dart';
import 'package:dsa_learning/data/networking/endpoints.dart';
import 'package:dsa_learning/domain/networking/inetworking_client.dart';
import 'package:dsa_learning/domain/rewards/irewards_repository.dart';

part 'rewards_repository_keys.dart';

class RewardsRepository implements IRewardsRepository {
  RewardsRepository({
    required INetworkingClient networkingClient,
  }) : _networkingClient = networkingClient;

  final INetworkingClient _networkingClient;

  @override
  Future<void> update({
    required int bytes,
    required int hash,
    required int vents,
  }) async {
    try {
      final Response? response = await _networkingClient.put(
        Endpoints.rewardsEndpoint,
        queryParameters: {
          _RewardsRepositoryKeys.bytes: bytes,
          _RewardsRepositoryKeys.hash: hash,
          _RewardsRepositoryKeys.fans: vents,
        },
      );
    } catch (error) {
      logger.e(error);
      rethrow;
    }
  }
}
