import 'package:flutter/material.dart';

abstract interface class INavigationUtil {
  GlobalKey<NavigatorState> get navigatorKey;

  bool get canPop;

  Future<dynamic> navigateTo<T extends Object?>(
    String routeName, {
    bool allowBackNavigation = true,
    dynamic data,
  });

  void navigateBack({
    dynamic data,
    int pagesNum = 1,
  });

  Future<dynamic> navigateToAndMakeRoot<T extends Object?>(
    String routeName, {
    dynamic data,
    bool allowBackNavigation = true,
  });

  Future<dynamic> navigateToAndReplace<T extends Object?>(
    String routeName, {
    dynamic data,
  });

  void navigateBackUntilNamed(String named);

  void navigateBackToStart();
}
