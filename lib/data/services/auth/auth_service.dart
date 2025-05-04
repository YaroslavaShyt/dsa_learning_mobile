import 'package:dsa_learning/core/utils/logging/logger.dart';
import 'package:dsa_learning/data/services/auth/auth_state.dart';
import 'package:dsa_learning/domain/auth/iauth_repository.dart';
import 'package:dsa_learning/domain/auth/iauth_response.dart';
import 'package:dsa_learning/domain/auth/isign_in_model.dart';
import 'package:dsa_learning/domain/auth/isign_up_model.dart';
import 'package:dsa_learning/domain/services/auth/iauth_service.dart';
import 'package:dsa_learning/domain/services/auth/itoken_service.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuthService extends Cubit<AuthState> implements IAuthService {
  AuthService({
    required ITokenService tokenService,
    required IAuthRepository repository,
  })  : _tokenService = tokenService,
        _repository = repository,
        super(const AuthState());

  final ITokenService _tokenService;
  final IAuthRepository _repository;

  @override
  Future<void> checkAuth() async {
    try {
      final String? token = await _tokenService.getToken();
      if (token == null) {
        emit(state.copyWith(status: AuthStatus.notAuthorized));
        return;
      }

      emit(state.copyWith(status: AuthStatus.authorized));
    } catch (error) {
      logger.e(error);
    }
  }

  @override
  Future<void> signIn({required ISignInModel signInModel}) async {
    try {
      final IAuthResponse? response = await _repository.signIn(signInModel);
      if (response == null) {
        emit(state.copyWith(status: AuthStatus.notAuthorized));
        return;
      }
      await _tokenService.saveToken(response);
      emit(state.copyWith(status: AuthStatus.authorized));
    } catch (error) {
      rethrow;
    }
  }

  @override
  Future<void> signUp({required ISignUpModel signUpModel}) async {
    try {
      final IAuthResponse? response = await _repository.signUp(signUpModel);
      if (response == null) {
        emit(state.copyWith(status: AuthStatus.notAuthorized));
        return;
      }
      await _tokenService.saveToken(response);
      emit(state.copyWith(status: AuthStatus.authorized));
    } catch (error) {
      rethrow;
    }
  }

  @override
  Future<void> signOut() async {
    try {
      await _tokenService.clearToken();
      emit(state.copyWith(status: AuthStatus.notAuthorized));
    } catch (error) {
      logger.e(error);
    }
  }
}
