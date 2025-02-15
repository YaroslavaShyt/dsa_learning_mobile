abstract interface class IUser {
  IUser({
    required this.name,
    required this.email,
  });

  final String name;
  final String email;
}
