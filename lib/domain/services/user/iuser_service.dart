import 'package:dsa_learning/domain/user/iuser.dart';

abstract interface class IUserService {
  IUser? get user;

  Future<void> init();

  Future<void> updateUser({
    String? profilePhoto,
  });

  Future<void> cleanUserData();
}
