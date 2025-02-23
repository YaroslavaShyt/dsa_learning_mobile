import 'package:equatable/equatable.dart';

enum UserStatus { initialized, notInitialized }

class UserState extends Equatable {
  const UserState({
    this.status = UserStatus.notInitialized,
  });

  UserState copyWith({
    UserStatus? status,
  }) {
    return UserState(
      status: status ?? this.status,
    );
  }

  final UserStatus status;

  @override
  List<Object?> get props => [
        status,
      ];
}
