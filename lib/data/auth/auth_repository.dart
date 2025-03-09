import 'package:dio/dio.dart';
import 'package:dsa_learning/data/auth/auth_response.dart';
import 'package:dsa_learning/data/networking/endpoints.dart';
import 'package:dsa_learning/domain/auth/iauth_repository.dart';
import 'package:dsa_learning/domain/auth/iauth_response.dart';
import 'package:dsa_learning/domain/auth/isign_in_model.dart';
import 'package:dsa_learning/domain/auth/isign_up_model.dart';
import 'package:dsa_learning/domain/networking/inetworking_client.dart';

class AuthRepository implements IAuthRepository {
  AuthRepository({
    required INetworkingClient networkingClient,
  }) : _networkingClient = networkingClient;

  final INetworkingClient _networkingClient;

  @override
  Future<IAuthResponse?> signIn(ISignInModel model) async {
    try {
      final Response? response = await _networkingClient.post(
        Endpoints.signInEndpoint,
        body: model.toJson(),
      );
      if (response == null) return null;

      if (response.statusCode == 200) {
        return AuthResponse.fromJson(response.data);
      }
    } catch (_) {
      rethrow;
    }
    return null;
  }

  @override
  Future<IAuthResponse?> signUp(ISignUpModel model) async {
    try {
      final Response? response = await _networkingClient.post(
        Endpoints.signUpEndpoint,
        body: model.toJson(),
      );
      if (response == null) return null;

      if (response.statusCode == 200) {
        return AuthResponse.fromJson(response.data);
      }
    } catch (_) {
      rethrow;
    }
    return null;
  }
}
