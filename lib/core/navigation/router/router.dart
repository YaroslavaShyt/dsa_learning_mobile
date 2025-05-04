import 'package:dsa_learning/core/navigation/routes.dart';
import 'package:dsa_learning/presentation/initial/auth/auth_factory.dart';
import 'package:dsa_learning/presentation/initial/initial_factory.dart';
import 'package:dsa_learning/presentation/initial/main/learn/lesson/lesson_factory.dart';
import 'package:dsa_learning/presentation/initial/main/learn/lesson_finished/lesson_finished_factory.dart';
import 'package:dsa_learning/presentation/initial/main/main_factory.dart';
import 'package:flutter/material.dart';

class AppRouter {
  static Route? onGenerateRoute(RouteSettings routeSettings) {
    return switch (routeSettings.name) {
      AppRoutes.routeAuth => _buildAuth(routeSettings),
      AppRoutes.routeMain => _buildMain(routeSettings),
      AppRoutes.routeLesson => _buildLesson(routeSettings),
      AppRoutes.routeLessonFinished => _buildLessonFinished(routeSettings),
      _ => _buildInitial(routeSettings),
    };
  }

  static PageRoute _buildInitial(RouteSettings settings) {
    return MaterialPageRoute(
      settings: settings,
      builder: (_) => InitialFactory.build(),
    );
  }

  static PageRoute _buildAuth(RouteSettings settings) {
    return MaterialPageRoute(
      settings: settings,
      builder: (_) => AuthFactory.build(),
    );
  }

  static PageRoute _buildMain(RouteSettings settings) {
    return MaterialPageRoute(
      settings: settings,
      builder: (_) => MainFactory.build(),
    );
  }

  static PageRoute _buildLesson(RouteSettings settings) {
    return MaterialPageRoute(
      settings: settings,
      builder: (_) => LessonFactory.build(
        settings.arguments as LessonRoutingArgs,
      ),
    );
  }

  static PageRoute _buildLessonFinished(RouteSettings settings) {
    return MaterialPageRoute(
      settings: settings,
      builder: (_) => LessonFinishedFactory.build(
        settings.arguments as LessonFinishedRoutingArgs,
      ),
    );
  }
}
