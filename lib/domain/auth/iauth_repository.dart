import 'package:dsa_learning/domain/auth/isign_in_model.dart';
import 'package:dsa_learning/domain/auth/isign_up_model.dart';

abstract interface class IAuthRepository {
  Future<String?> signIn(ISignInModel model);

  Future<String?> signUp(ISignUpModel model);
}
