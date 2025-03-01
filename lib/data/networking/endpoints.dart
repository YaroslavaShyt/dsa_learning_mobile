class Endpoints {
  static const String baseEndpoint = 'http://10.0.0.36:8080/api/';

  // auth
  static const String _auth = 'auth';
  static const String signInEndpoint = '$_auth/signin';
  static const String signUpEndpoint = '$_auth/signup';
}
