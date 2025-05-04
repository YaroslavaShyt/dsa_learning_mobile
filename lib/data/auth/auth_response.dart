import 'package:dsa_learning/domain/auth/iauth_response.dart';

const String _userId = 'userId';
const String _token = 'token';

class AuthResponse implements IAuthResponse {
  AuthResponse({
    required this.token,
    required this.userId,
  });

  factory AuthResponse.fromJson(Map<dynamic, dynamic> json) {
    return AuthResponse(
      token: json[_token],
      userId: json[_userId],
    );
  }

  @override
  final int userId;

  @override
  final String token;
}
