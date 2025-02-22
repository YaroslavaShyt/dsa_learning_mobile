import 'package:dsa_learning/core/services/auth/auth_state.dart';
import 'package:dsa_learning/domain/models/auth/iauth_result.dart';
import 'package:dsa_learning/domain/models/auth/isign_in_model.dart';
import 'package:dsa_learning/domain/models/auth/isign_up_model.dart';
import 'package:dsa_learning/domain/services/iauth_service.dart';
import 'package:dsa_learning/domain/services/itoken_service.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuthService extends Cubit<AuthState> implements IAuthService {
  AuthService({
    required ITokenService tokenService,
  })  : _tokenService = tokenService,
        super(const AuthState());

  final ITokenService _tokenService;

  @override
  Future<IAuthResult> signIn({required ISignInModel signInModel}) {
    // TODO: implement signIn
    throw UnimplementedError();
  }

  @override
  Future<IAuthResult> signUp({required ISignUpModel signUpModel}) {
    // TODO: implement signUp
    throw UnimplementedError();
  }
}
