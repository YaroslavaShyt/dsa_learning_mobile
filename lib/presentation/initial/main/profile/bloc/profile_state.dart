import 'package:equatable/equatable.dart';

class ProfileState extends Equatable {
  const ProfileState({
    this.userName = 'Yaroslava Shyt',
    this.profilePhoto = '',
    this.isAboutInfoShown = false,
    this.isLanguageShown = false,
  });

  ProfileState copyWith({
    String? userName,
    String? profilePhoto,
    bool? isAboutInfoShown,
    bool? isLanguageShown,
  }) {
    return ProfileState(
      userName: userName ?? this.userName,
      profilePhoto: profilePhoto ?? this.profilePhoto,
      isAboutInfoShown: isAboutInfoShown ?? this.isAboutInfoShown,
      isLanguageShown: isLanguageShown ?? this.isLanguageShown,
    );
  }

  final String userName;
  final String profilePhoto;
  final bool isLanguageShown;
  final bool isAboutInfoShown;

  @override
  List<Object?> get props => [
        userName,
        profilePhoto,
        isLanguageShown,
        isAboutInfoShown,
      ];
}
