import 'package:dsa_learning/core/navigation/routes.dart';
import 'package:dsa_learning/core/constants/system.dart';
import 'package:dsa_learning/core/navigation/router/router.dart';
import 'package:dsa_learning/data/services/auth/auth_service.dart';
import 'package:dsa_learning/core/utils/theme/app_color_theme.dart';
import 'package:dsa_learning/data/auth/auth_repository.dart';
import 'package:dsa_learning/data/services/user/user_service.dart';
import 'package:dsa_learning/domain/auth/iauth_repository.dart';
import 'package:dsa_learning/core/localization/codegen_loader.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:dsa_learning/data/services/auth/token/token_service.dart';
import 'package:dsa_learning/data/storage/local_storage.dart';
import 'package:dsa_learning/data/storage/secure_storage.dart';
import 'package:dsa_learning/domain/networking/inetworking_client.dart';
import 'package:dsa_learning/domain/storage/ilocal_storage.dart';
import 'package:dsa_learning/domain/storage/isecure_storage.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

import 'data/networking/networking_client.dart';
import 'domain/services/auth/itoken_service.dart';

part 'presentation/app.dart';

part 'core/utils/service_locator/service_locator.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await EasyLocalization.ensureInitialized();

  _ServiceLocator.init();

  runApp(
    EasyLocalization(
      assetLoader: CodegenLoader(),
      supportedLocales: SystemConstants.supportedLocales,
      path: SystemConstants.localePath,
      fallbackLocale: SystemConstants.fallbackLocale,
      child: _MainApp(),
    ),
  );
}
