part of '../../../main.dart';

final sl = GetIt.instance;

class _ServiceLocator {
  static void init() {
    _initLocalStorage();
    _initNetworking();
    _initRepos();
    _initService();
  }

  static void _initLocalStorage() {
    sl.registerFactory<ILocalStorage>(() => LocalStorage());
    sl.registerFactory<ISecureStorage>(() => SecureStorage());
  }

  static void _initNetworking() {
    sl.registerFactory<INetworkingClient>(() => NetworkingClient());
  }

  static void _initRepos() {
    sl.registerFactory<IAuthRepository>(
      () => AuthRepository(networkingClient: sl.get<INetworkingClient>()),
    );
  }

  static void _initService() {
    sl.registerFactory<ITokenService>(
      () => TokenService(storage: sl.get<ISecureStorage>()),
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
