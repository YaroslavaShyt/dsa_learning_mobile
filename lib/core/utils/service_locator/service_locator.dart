part of '../../../main.dart';

final sl = GetIt.instance;

class _ServiceLocator {
  static Future<void> init() async {
    await _initLocalStorage();
    _initNavigation();
    _initNetworking();
    _initUtils();
    _initRepos();
    _initService();
    _initHandlers();
  }

  static void _initNavigation() {
    sl.registerSingleton<INavigationUtil>(NavigationUtil());
  }

  static Future<void> _initLocalStorage() async {
    final SharedPreferences sharedPref = await SharedPreferences.getInstance();
    sl.registerFactory<ILocalStorage>(
      () => LocalStorage(
        sharedPreferences: sharedPref,
      ),
    );
    sl.registerFactory<ISecureStorage>(
      () => SecureStorage(
        sharedPreferences: sharedPref,
      ),
    );
  }

  static void _initNetworking() {
    sl.registerFactory<INetworkingClient>(
      () => NetworkingClient(
        secureStorage: sl.get<ISecureStorage>(),
      ),
    );
  }

  static void _initRepos() {
    final INetworkingClient networkingClient = sl.get<INetworkingClient>();
    sl.registerFactory<IAuthRepository>(
      () => AuthRepository(networkingClient: networkingClient),
    );
    sl.registerFactory<IUserRepository>(
      () => UserRepository(
        backgroundParser: sl.get<IBackgroundParser>(),
        networkingClient: networkingClient,
      ),
    );
    sl.registerFactory<IAchievementsRepository>(
      () => AchievementsRepository(
        backgroundParser: sl.get<IBackgroundParser>(),
        networkingClient: networkingClient,
      ),
    );
    sl.registerFactory<ILessonRepository>(
      () => LessonRepository(networkingClient: networkingClient),
    );
    sl.registerFactory<IRewardsRepository>(
      () => RewardsRepository(networkingClient: networkingClient),
    );
    sl.registerFactory<IStatisticsRepository>(
      () => StatisticsRepository(networkingClient: networkingClient),
    );
  }

  static void _initService() {
    sl.registerFactory<ITokenService>(
      () => TokenService(storage: sl.get<ISecureStorage>()),
    );
    sl.registerFactory<IPermissionService>(
      () => PermissionService(
        deviceInfoPlugin: DeviceInfoPlugin(),
        localStorage: sl.get<ILocalStorage>(),
      ),
    );
    sl.registerSingleton<ILessonService>(
      LessonService(lessonRepository: sl.get<ILessonRepository>()),
    );
  }

  static void _initUtils() {
    sl.registerFactory<IBackgroundParser>(
      () => BackgroundParser(),
    );
  }

  static void _initHandlers() {
    sl.registerFactory<ICameraHandler>(() => CameraHandler());
    sl.registerFactory<IFileHandler>(() => FileHandler());
    sl.registerFactory<ISelectImageHandler>(
      () => SelectImageHandler(
        permissionService: sl.get<IPermissionService>(),
        cameraHandler: sl.get<ICameraHandler>(),
        fileHandler: sl.get<IFileHandler>(),
      ),
    );
    sl.registerFactory<IVibrationHandler>(() => VibrationHandler());
    sl.registerSingleton<IAudioHandler>(AudioHandler()).initButtonAudio();
  }

  static List<BlocProvider> get cubitAsService => [
        BlocProvider<RewardsService>(
          create: (BuildContext context) => RewardsService(
            rewardsRepository: sl.get<IRewardsRepository>(),
          ),
        ),
        BlocProvider<AchievementsService>(
          create: (BuildContext context) => AchievementsService(
            achievementsRepository: sl.get<IAchievementsRepository>(),
          ),
        ),
        BlocProvider<AuthService>(
          create: (_) => AuthService(
            tokenService: sl.get<ITokenService>(),
            repository: sl.get<IAuthRepository>(),
          )..checkAuth(),
        ),
        BlocProvider<UserService>(
          create: (BuildContext context) => UserService(
            userRepository: sl.get<IUserRepository>(),
            authService: BlocProvider.of<AuthService>(context),
            rewardsService: BlocProvider.of<RewardsService>(context),
          )..onAuthStateChanged(),
        ),
        BlocProvider<StatisticsCubit>(
          create: (BuildContext context) => StatisticsCubit(
            statisticsRepository: sl.get<IStatisticsRepository>(),
          ),
        ),
      ];
}
