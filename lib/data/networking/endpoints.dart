class Endpoints {
  static const String baseEndpoint = 'http://10.0.0.33:5000/api/';

  // auth
  static const String _auth = 'auth';
  static const String signInEndpoint = '$_auth/signin';
  static const String signUpEndpoint = '$_auth/signup';

  // achievements
  static const String _achievements = 'achievements';
  static const String getAllAchievementsEndpoint = '$_achievements/';

  static String getUserAchievementsEndpoint({required String userId}) =>
      '$_achievements/user/$userId';

  static String addNewAchievementEndpoint(
          {required String userId, required String achievementId}) =>
      '$_achievements/user/$userId/add/$achievementId';

  // streak
  static const String _streak = 'streak';

  static String getUserStreakEndpoint({required String userId}) =>
      '$_streak/$userId';

  static String updateUserStreakEndpoint({required String userId}) =>
      '$_streak/$userId/update';
}
