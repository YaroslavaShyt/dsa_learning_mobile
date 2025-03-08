import 'package:equatable/equatable.dart';

class ProfileState extends Equatable {
  const ProfileState({
    this.userName = 'Yaroslava Shyt',
    this.profilePhoto = '',
  });

  ProfileState copyWith({
    String? userName,
    String? profilePhoto,
  }) {
    return ProfileState(
      userName: userName ?? this.userName,
      profilePhoto: profilePhoto ?? this.profilePhoto,
    );
  }

  final String userName;
  final String profilePhoto;

  @override
  List<Object?> get props => [
        userName,
        profilePhoto,
      ];
}
