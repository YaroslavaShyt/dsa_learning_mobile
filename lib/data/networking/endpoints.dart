class Endpoints {
  /// ipconfig from windows
  static const String baseEndpoint = 'http://10.0.0.35:5000/api/';

  /// AUTH
  static const String _auth = 'auth';
  static const String signInEndpoint = '$_auth/signin';
  static const String signUpEndpoint = '$_auth/signup';

  /// USER
  static const String userEndpoint = 'users';

  /// ACHIEVEMENTS
  static const String _achievements = 'achievements';
  static const String getAllAchievementsEndpoint = '$_achievements/';
  static String userAchievementsEndpoint = '$_achievements/user/';

  static String addNewAchievementEndpoint({
    required String userId,
    required String achievementId,
  }) =>
      '$_achievements/user/$userId/add/$achievementId';

  /// STREAK
  static const String _streak = 'streak';
  static String userStreakEndpoint = "$_streak/";
  static String updateUserStreakEndpoint = '$_streak/update';

  /// REWARDS
  static const String _rewards = 'rewards';
  static const String rewardsEndpoint = '$_rewards/update';

  /// STATISTICS
  static const String _statistics = 'statistics';
  static const String statisticsEndpoint = '$_statistics/';

  /// LESSON
  static const String _lessonEndpoint = 'lessons';
  static const String getLessonSummaryEndpoint = '$_lessonEndpoint/summary';

  static String getLessonTheory(int id) => '$_lessonEndpoint/$id/details';

  static String getLessonGame(int id) => '$_lessonEndpoint/$id/game';

  static const String _trainings = 'trainings';
  static const String getLearnedLessonsEndpoint = '$_trainings/user';
  static const String finishLessonEndpoint = '$_trainings/complete';
}
