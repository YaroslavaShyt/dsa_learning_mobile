import 'package:dsa_learning/core/services/auth/token/token_service.dart';
import 'package:dsa_learning/data/storage/local_storage.dart';
import 'package:dsa_learning/data/storage/secure_storage.dart';
import 'package:dsa_learning/domain/services/itoken_service.dart';
import 'package:dsa_learning/domain/storage/ilocal_storage.dart';
import 'package:dsa_learning/domain/storage/isecure_storage.dart';
import 'package:get_it/get_it.dart';

final sl = GetIt.instance;

class ServiceLocator {
  void _initLocalStorage() {
    sl.registerFactory<ILocalStorage>(() => LocalStorage());
    sl.registerFactory<ISecureStorage>(() => SecureStorage());
  }

  void _initService() {
    sl.registerFactory<ITokenService>(
      () => TokenService(
        storage: sl.get<ISecureStorage>(),
      ),
    );
  }
}
