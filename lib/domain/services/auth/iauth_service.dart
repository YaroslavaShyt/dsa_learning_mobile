import 'package:dsa_learning/data/services/auth/auth_state.dart';
import 'package:dsa_learning/domain/auth/isign_in_model.dart';
import 'package:dsa_learning/domain/auth/isign_up_model.dart';

abstract interface class IAuthService {
  Future<void> checkAuth();

  Future<void> signIn({
    required ISignInModel signInModel,
  });

  Future<void> signUp({
    required ISignUpModel signUpModel,
  });

  Future<void> signOut();

  Stream<AuthState> get stream;
}
