part of '../main.dart';

class _MainApp extends StatelessWidget {
  const _MainApp({
    required INavigationUtil navigationUtil,
  }) : _navigationUtil = navigationUtil;

  final INavigationUtil _navigationUtil;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: _ServiceLocator.cubitAsService,
      child: MaterialApp(
        navigatorKey: _navigationUtil.navigatorKey,
        theme: AppColorTheme.theme(context),
        initialRoute: AppRoutes.routeInitial,
        onGenerateRoute: AppRouter.onGenerateRoute,
        localizationsDelegates: context.localizationDelegates,
        supportedLocales: context.supportedLocales,
        locale: context.locale,
      ),
    );
  }
}
