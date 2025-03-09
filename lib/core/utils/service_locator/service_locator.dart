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
    sl.registerFactory<IAuthRepository>(
      () => AuthRepository(networkingClient: sl.get<INetworkingClient>()),
    );
    sl.registerFactory<IUserRepository>(
      () => UserRepository(
        backgroundParser: sl.get<IBackgroundParser>(),
        networkingClient: sl.get<INetworkingClient>(),
      ),
    );
    sl.registerFactory<IAchievementsRepository>(
      () => AchievementsRepository(
        backgroundParser: sl.get<IBackgroundParser>(),
        networkingClient: sl.get<INetworkingClient>(),
      ),
    );
  }

  static void _initService() {
    sl.registerFactory<ITokenService>(
      () => TokenService(storage: sl.get<ISecureStorage>()),
    );
    sl.registerSingleton<IAchievementsService>(
      AchievementsService(
        achievementsRepository: sl.get<IAchievementsRepository>(),
      ),
    );
    sl.registerFactory<IPermissionService>(
      () => PermissionService(
        deviceInfoPlugin: DeviceInfoPlugin(),
        localStorage: sl.get<ILocalStorage>(),
      ),
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
  }

  static List<BlocProvider> get cubitAsService => [
        BlocProvider<AuthService>(
          create: (_) => AuthService(
            tokenService: sl.get<ITokenService>(),
            repository: sl.get<IAuthRepository>(),
          )..checkAuth(),
        ),
        BlocProvider<UserService>(
          create: (BuildContext context) => UserService(
            authService: BlocProvider.of<AuthService>(context),
            userRepository: sl.get<IUserRepository>(),
          )..onAuthStateChanged(),
        ),
      ];
}
