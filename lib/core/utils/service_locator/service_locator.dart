part of '../../../main.dart';

final sl = GetIt.instance;

class _ServiceLocator {
  static Future<void> init() async {
    await _initLocalStorage();
    _initNetworking();
    _initUtils();
    _initRepos();
    _initService();
  }

  static Future<void> _initLocalStorage() async {
    final SharedPreferences sharedPref = await SharedPreferences.getInstance();
    sl.registerFactory<ILocalStorage>(() => LocalStorage());
    sl.registerFactory<ISecureStorage>(() => SecureStorage(
          sharedPreferences: sharedPref,
        ));
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
  }

  static void _initUtils() {
    sl.registerFactory<IBackgroundParser>(
      () => BackgroundParser(),
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
          )..onAuthStateChanged(),
        ),
      ];
}
