import 'package:dsa_learning/core/constants/system.dart';
import 'package:dsa_learning/core/localization/codegen_loader.g.dart';
import 'package:dsa_learning/core/navigation/inavigation_util.dart';
import 'package:dsa_learning/core/navigation/navigation_util.dart';
import 'package:dsa_learning/core/navigation/route_observer.dart';
import 'package:dsa_learning/core/navigation/router/router.dart';
import 'package:dsa_learning/core/utils/parsers/background_parser.dart';
import 'package:dsa_learning/core/utils/theme/app_color_theme.dart';
import 'package:dsa_learning/core/utils/theme/color_palette.dart';
import 'package:dsa_learning/data/auth/auth_repository.dart';
import 'package:dsa_learning/data/handlers/audio_handler.dart';
import 'package:dsa_learning/data/handlers/streak_handler.dart';
import 'package:dsa_learning/data/lesson/lesson_repository.dart';
import 'package:dsa_learning/data/rewards/achievements/achievements_repository.dart';
import 'package:dsa_learning/data/rewards/rewards_repository.dart';
import 'package:dsa_learning/data/services/achievements/achievements_service.dart';
import 'package:dsa_learning/data/services/auth/auth_service.dart';
import 'package:dsa_learning/data/services/auth/token/token_service.dart';
import 'package:dsa_learning/data/services/handlers/sounds/vibration_handler.dart';
import 'package:dsa_learning/data/services/handlers/tutorial_handler.dart';
import 'package:dsa_learning/data/services/lessons/lesson_service.dart';
import 'package:dsa_learning/data/services/rewards/rewards_service.dart';
import 'package:dsa_learning/data/services/user/user_service.dart';
import 'package:dsa_learning/data/statistics/statistics_repository.dart';
import 'package:dsa_learning/data/storage/local_storage.dart';
import 'package:dsa_learning/data/storage/secure_storage.dart';
import 'package:dsa_learning/data/user/user_repository.dart';
import 'package:dsa_learning/domain/auth/iauth_repository.dart';
import 'package:dsa_learning/domain/handlers/iaudio_handler.dart';
import 'package:dsa_learning/domain/handlers/istreak_handler.dart';
import 'package:dsa_learning/domain/lesson/ilesson_repository.dart';
import 'package:dsa_learning/domain/networking/inetworking_client.dart';
import 'package:dsa_learning/domain/rewards/achievements/iachievements_repository.dart';
import 'package:dsa_learning/domain/rewards/irewards_repository.dart';
import 'package:dsa_learning/domain/services/handlers/itutorial_handler.dart';
import 'package:dsa_learning/domain/services/handlers/sounds/ivibration_handler.dart';
import 'package:dsa_learning/domain/services/lesson/ilesson_service.dart';
import 'package:dsa_learning/domain/statistics/istatistics_repository.dart';
import 'package:dsa_learning/domain/storage/ilocal_storage.dart';
import 'package:dsa_learning/domain/storage/isecure_storage.dart';
import 'package:dsa_learning/domain/user/iuser_repository.dart';
import 'package:dsa_learning/presentation/initial/initial_factory.dart';
import 'package:dsa_learning/presentation/initial/main/home/widgets/statistics/bloc/statistics_cubit.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'data/networking/networking_client.dart';
import 'domain/services/auth/itoken_service.dart';

part 'core/utils/service_locator/service_locator.dart';
part 'presentation/app.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      systemNavigationBarColor: ColorPalette.rebeccaPurple,
    ),
  );

  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  await EasyLocalization.ensureInitialized();

  await _ServiceLocator.init();

  runApp(
    EasyLocalization(
      assetLoader: const CodegenLoader(),
      supportedLocales: SystemConstants.supportedLocales,
      path: SystemConstants.localePath,
      fallbackLocale: SystemConstants.fallbackLocale,
      child: _MainApp(
        navigationUtil: sl.get<INavigationUtil>(),
      ),
    ),
  );
}
