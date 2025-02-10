// DO NOT EDIT. This is code generated via package:easy_localization/generate.dart

// ignore_for_file: prefer_single_quotes, avoid_renaming_method_parameters, constant_identifier_names

import 'dart:ui';

import 'package:easy_localization/easy_localization.dart' show AssetLoader;

class CodegenLoader extends AssetLoader{
  const CodegenLoader();

  @override
  Future<Map<String, dynamic>?> load(String path, Locale locale) {
    return Future.value(mapLocales[locale.toString()]);
  }

  static const Map<String,dynamic> _en_GB = {
  "language": "Language",
  "deleteAccount": "Delete Account",
  "exit": "Exit",
  "aboutApp": "About the App",
  "version": "Version"
};
static const Map<String,dynamic> _es_ES = {
  "language": "Idioma",
  "deleteAccount": "Eliminar cuenta",
  "exit": "Salir",
  "aboutApp": "Acerca de la aplicación",
  "version": "Versión"
};
static const Map<String,dynamic> _uk_UA = {
  "language": "Мова",
  "deleteAccount": "Видалити обліковий запис",
  "exit": "Вихід",
  "aboutApp": "Про застосунок",
  "version": "Версія"
};
static const Map<String, Map<String,dynamic>> mapLocales = {"en_GB": _en_GB, "es_ES": _es_ES, "uk_UA": _uk_UA};
}
