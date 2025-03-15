class Endpoints {
  static const String baseEndpoint = 'http://10.0.0.35:5000/api/';

  // auth
  static const String _auth = 'auth';
  static const String signInEndpoint = '$_auth/signin';
  static const String signUpEndpoint = '$_auth/signup';

  // user
  static const String userEndpoint = 'users';

  // achievements
  static const String _achievements = 'achievements';
  static const String getAllAchievementsEndpoint = '$_achievements/';

  static String userAchievementsEndpoint = '$_achievements/user/';

  static String addNewAchievementEndpoint(
          {required String userId, required String achievementId}) =>
      '$_achievements/user/$userId/add/$achievementId';

  // streak
  static const String _streak = 'streak';

  static String userStreakEndpoint = "$_streak/";

  static String updateUserStreakEndpoint = '$_streak/update/';
}
