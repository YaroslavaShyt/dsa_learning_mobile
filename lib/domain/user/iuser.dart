abstract interface class IUser {
  IUser({
    required this.id,
    required this.firstName,
    required this.bytes,
    required this.fans,
    required this.hash,
    required this.fansUpdatedLast,
    this.profilePhoto = '',
    this.unlockedAvatars = const [],
    this.sounds = true,
    this.vibration = true,
  });

  IUser copyWith({
    String? id,
    String? firstName,
    int? bytes,
    int? fans,
    int? hash,
    String? profilePhoto,
    List<String>? unlockedAvatars,
    bool? vibration,
    bool? sounds,
    DateTime? fansUpdatedLast,
  });

  Map<String, String> toJson(IUser user);

  final String id;
  final String firstName;
  final int bytes;
  final int fans;
  final int hash;
  final String profilePhoto;
  final List<String> unlockedAvatars;
  final bool vibration;
  final bool sounds;
  final DateTime fansUpdatedLast;
}
