import 'dart:ui';

class SystemConstants {
  static const String localePath = 'assets/localization/';
  static const List<Locale> supportedLocales = [
    Locale('en', 'GB'),
    Locale('es', 'ES'),
    Locale('uk', 'UA'),
  ];
  static const Locale fallbackLocale = Locale('en', 'GB');
}
