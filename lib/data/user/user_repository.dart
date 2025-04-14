import 'package:dio/dio.dart';
import 'package:dsa_learning/core/exceptions/user_not_found_exception.dart';
import 'package:dsa_learning/core/utils/logging/logger.dart';
import 'package:dsa_learning/core/utils/parsers/background_parser.dart';
import 'package:dsa_learning/data/networking/endpoints.dart';
import 'package:dsa_learning/data/user/user.dart';
import 'package:dsa_learning/domain/networking/inetworking_client.dart';
import 'package:dsa_learning/domain/user/iuser.dart';
import 'package:dsa_learning/domain/user/iuser_repository.dart';

class UserRepository implements IUserRepository {
  UserRepository({
    required INetworkingClient networkingClient,
    required IBackgroundParser backgroundParser,
  })  : _backgroundParser = backgroundParser,
        _networkingClient = networkingClient;

  final INetworkingClient _networkingClient;
  final IBackgroundParser _backgroundParser;

  @override
  Future<IUser?> getUser() async {
    try {
      final Response? response = await _networkingClient.get(
        Endpoints.userEndpoint,
      );

      if (response == null) return null;

      if (response.statusCode == 200) {
        return await _backgroundParser.parse(
          parseFunction: User.fromJson,
          data: response.data,
        );
      }
    } on DioException catch (error) {
      if (error is UserNotFoundException) {
        print('kek');
      }
    } catch (error) {
      if (error is UserNotFoundException) {
        throw UserNotFoundException();
      }
      logger.e(error);
      rethrow;
    }
    return null;
  }

  @override
  Future<void> updateUser(Map<String, String> data) async {
    try {
      await _networkingClient.put(
        Endpoints.userEndpoint,
        body: data,
      );
    } catch (error) {
      logger.e(error);
    }
  }

  @override
  Future<bool> deleteUser() async {
    try {
      final Response? response =
          await _networkingClient.delete(Endpoints.userEndpoint);
      if (response == null) return false;

      if (response.statusCode == 200) return true;
    } catch (error) {
      logger.e(error);
    }
    return false;
  }
}
