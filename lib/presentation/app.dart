part of '../main.dart';

class _MainApp extends StatelessWidget {
  const _MainApp();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: AppColorTheme.theme,
      initialRoute: AppRoutes.routeAuth,
      onGenerateRoute: AppRouter.onGenerateRoute,
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
    );
  }
}
