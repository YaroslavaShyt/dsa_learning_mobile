abstract interface class IUser {
  IUser({
    required this.id,
    required this.firstName,
    required this.bytes,
    required this.fans,
    required this.hash,
  });

  final String id;
  final String firstName;
  final int bytes;
  final int fans;
  final int hash;
}
