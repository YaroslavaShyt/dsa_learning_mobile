import 'package:dsa_learning/domain/user/iuser.dart';

abstract interface class IUserRepository {
  Future<IUser?> getUser();

  Future<void> updateUser(Map<String, String> data);

  Future<bool> deleteUser();
}
