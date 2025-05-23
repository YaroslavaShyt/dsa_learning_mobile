import 'package:dsa_learning/domain/user/iuser.dart';
import 'package:equatable/equatable.dart';

enum UserStatus {
  initialized,
  notInitialized,
  undefined,
}

class UserState extends Equatable {
  const UserState({
    this.status = UserStatus.undefined,
    this.user,
  });

  UserState copyWith({
    UserStatus? status,
    IUser? user,
  }) {
    return UserState(
      user:
          status == UserStatus.notInitialized || status == UserStatus.undefined
              ? null
              : user,
      status: status ?? this.status,
    );
  }

  final IUser? user;
  final UserStatus status;

  @override
  List<Object?> get props => [
        user,
        status,
      ];
}
