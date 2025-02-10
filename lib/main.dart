import 'package:dsa_learning/core/constants/routes.dart';
import 'package:dsa_learning/core/constants/system.dart';
import 'package:dsa_learning/core/utils/navigation/router/router.dart';
import 'package:dsa_learning/core/utils/theme/app_color_theme.dart';
import 'package:dsa_learning/localization/codegen_loader.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

part 'presentation/app.dart';

Future<void> main() async{
  WidgetsFlutterBinding.ensureInitialized();

  await EasyLocalization.ensureInitialized();

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
