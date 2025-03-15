abstract interface class IUser {
  IUser({
    required this.id,
    required this.firstName,
    required this.bytes,
    required this.fans,
    required this.hash,
    this.profilePhoto = '',
  });

  IUser copyWith({
    String? id,
    String? firstName,
    int? bytes,
    int? fans,
    int? hash,
    String? profilePhoto,
  });

  final String id;
  final String firstName;
  final int bytes;
  final int fans;
  final int hash;
  final String profilePhoto;
}
