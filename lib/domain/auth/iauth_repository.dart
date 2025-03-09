import 'package:dsa_learning/domain/auth/iauth_response.dart';
import 'package:dsa_learning/domain/auth/isign_in_model.dart';
import 'package:dsa_learning/domain/auth/isign_up_model.dart';

abstract interface class IAuthRepository {
  Future<IAuthResponse?> signIn(ISignInModel model);

  Future<IAuthResponse?> signUp(ISignUpModel model);
}
