import 'package:dsa_learning/domain/user/iuser.dart';

const String _id = 'id';
const String _firstName = 'firstName';
const String _bytes = 'bytes';
const String _fans = 'fans';
const String _hash = 'hash';

class User implements IUser {
  User({
    required this.id,
    required this.firstName,
    required this.bytes,
    required this.fans,
    required this.hash,
  });

  factory User.fromJson(Map<dynamic, dynamic> data) {
    return User(
      id: data[_id].toString(),
      firstName: data[_firstName],
      bytes: data[_bytes],
      fans: data[_fans],
      hash: data[_hash],
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
}
