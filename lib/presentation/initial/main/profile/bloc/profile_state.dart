import 'package:equatable/equatable.dart';

class ProfileState extends Equatable {
  const ProfileState({
    this.userName = 'Yaroslava Shyt',
    this.profilePhoto = '',
    this.isAboutInfoShown = false,
    this.isLanguageShown = false,
    this.isSoundEnabled = true,
    this.isVibrationEnabled = true,
  });

  ProfileState copyWith({
    String? userName,
    String? profilePhoto,
    bool? isAboutInfoShown,
    bool? isLanguageShown,
    bool? isVibrationEnabled,
    bool? isSoundEnabled,
  }) {
    return ProfileState(
      userName: userName ?? this.userName,
      profilePhoto: profilePhoto ?? this.profilePhoto,
      isAboutInfoShown: isAboutInfoShown ?? this.isAboutInfoShown,
      isLanguageShown: isLanguageShown ?? this.isLanguageShown,
      isVibrationEnabled: isVibrationEnabled ?? this.isVibrationEnabled,
      isSoundEnabled: isSoundEnabled ?? this.isSoundEnabled,
    );
  }

  final String userName;
  final String profilePhoto;
  final bool isLanguageShown;
  final bool isAboutInfoShown;
  final bool isVibrationEnabled;
  final bool isSoundEnabled;

  @override
  List<Object?> get props => [
        userName,
        profilePhoto,
        isLanguageShown,
        isAboutInfoShown,
        isVibrationEnabled,
        isSoundEnabled,
      ];
}
