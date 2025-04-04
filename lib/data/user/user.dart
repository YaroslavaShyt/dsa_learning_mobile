import 'package:dsa_learning/domain/user/iuser.dart';

const String _id = 'id';
const String _firstName = 'firstName';
const String _bytes = 'bytes';
const String _fans = 'fans';
const String _hash = 'hash';
const String _currentAvatar = 'currentAvatar';
const String _unlockedAvatars = 'avatars';
const String _vibration = 'vibration';
const String _sound = 'sound';

class User implements IUser {
  User({
    required this.id,
    required this.firstName,
    required this.bytes,
    required this.fans,
    required this.hash,
    required this.profilePhoto,
    required this.unlockedAvatars,
    required this.vibration,
    required this.sounds,
  });

  @override
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
  }) {
    return User(
      id: id ?? this.id,
      firstName: firstName ?? this.firstName,
      bytes: bytes ?? this.bytes,
      fans: fans ?? this.fans,
      hash: hash ?? this.fans,
      profilePhoto: profilePhoto ?? this.profilePhoto,
      unlockedAvatars: unlockedAvatars ?? this.unlockedAvatars,
      vibration: vibration ?? this.vibration,
      sounds: sounds ?? this.sounds,
    );
  }

  @override
  Map<String, String> toJson(IUser user) {
    return {
      _id: id,
      _firstName: firstName,
      _unlockedAvatars: unlockedAvatars.join(','),
      _currentAvatar: profilePhoto,
      _bytes: bytes.toString(),
      _hash: hash.toString(),
      _fans: fans.toString(),
      _vibration: vibration.toString(),
      _sound: sounds.toString(),
    };
  }

  factory User.fromJson(Map<dynamic, dynamic> data) {
    return User(
      id: data[_id].toString(),
      firstName: data[_firstName],
      bytes: data[_bytes],
      fans: data[_fans],
      hash: data[_hash],
      profilePhoto: data[_currentAvatar],
      unlockedAvatars: (data[_unlockedAvatars] as String).split(','),
      vibration: data[_vibration],
      sounds: data[_sound],
    );
  }

  @override
  final String id;

  @override
  final String firstName;

  @override
  final int bytes;

  @override
  final int fans;

  @override
  final int hash;

  @override
  final String profilePhoto;

  @override
  final List<String> unlockedAvatars;

  @override
  final bool vibration;

  @override
  final bool sounds;
}
