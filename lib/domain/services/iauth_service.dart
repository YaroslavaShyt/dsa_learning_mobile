import 'package:dsa_learning/domain/models/auth/iauth_result.dart';
import 'package:dsa_learning/domain/models/auth/isign_in_model.dart';
import 'package:dsa_learning/domain/models/auth/isign_up_model.dart';

abstract interface class IAuthService {
  Future<IAuthResult> signIn({
    required ISignInModel signInModel,
  });

  Future<IAuthResult> signUp({
    required ISignUpModel signUpModel,
  });
}
