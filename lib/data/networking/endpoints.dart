class Endpoints {
  static const String baseEndpoint = 'https://172.23.240.1:8080/api/';

  // auth
  static const String _auth = 'auth';
  static const String signInEndpoint = '$_auth/signin';
  static const String signUpEndpoint = '$_auth/signup';
}
