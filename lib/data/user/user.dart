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
const String _animations = 'animations';
const String _fansUpdatedLast = 'fansUpdatedLast';
const String _isOnboarded = '_onboarded';

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
    required this.fansUpdatedLast,
    required this.animations,
    required this.isOnboarded,
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
    bool? animations,
    DateTime? fansUpdatedLast,
    bool? isOnboarded,
  }) {
    return User(
      id: id ?? this.id,
      fans: fans ?? this.fans,
      hash: hash ?? this.fans,
      bytes: bytes ?? this.bytes,
      sounds: sounds ?? this.sounds,
      isOnboarded: isOnboarded ?? this.isOnboarded,
      firstName: firstName ?? this.firstName,
      vibration: vibration ?? this.vibration,
      animations: animations ?? this.animations,
      profilePhoto: profilePhoto ?? this.profilePhoto,
      unlockedAvatars: unlockedAvatars ?? this.unlockedAvatars,
      fansUpdatedLast: fansUpdatedLast ?? this.fansUpdatedLast,
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
      _animations: animations.toString(),
      _isOnboarded: isOnboarded.toString(),
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
      animations: data[_animations],
      fansUpdatedLast: DateTime.parse(data[_fansUpdatedLast]).add(
        const Duration(hours: 2, minutes: 30),
      ),
      isOnboarded: data[_isOnboarded],
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

  @override
  final DateTime fansUpdatedLast;

  @override
  final bool animations;

  @override
  final bool isOnboarded;
}
