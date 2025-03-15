import 'package:dsa_learning/core/navigation/routes.dart';
import 'package:dsa_learning/presentation/initial/auth/auth_factory.dart';
import 'package:dsa_learning/presentation/initial/initial_factory.dart';
import 'package:dsa_learning/presentation/initial/main/home/home_factory.dart';
import 'package:dsa_learning/presentation/initial/main/learn/learn_factory.dart';
import 'package:dsa_learning/presentation/initial/main/main_factory.dart';
import 'package:dsa_learning/presentation/initial/main/profile/profile_factory.dart';
import 'package:flutter/material.dart';

class AppRouter {
  static Route? onGenerateRoute(RouteSettings routeSettings) {
    return switch (routeSettings.name) {
      AppRoutes.routeAuth => _buildAuth(routeSettings),
      AppRoutes.routeMain => _buildMain(routeSettings),
      AppRoutes.routeHome => _buildHome(routeSettings),
      AppRoutes.routeLearn => _buildLearn(routeSettings),
      AppRoutes.routeProfile => _buildProfile(routeSettings),
      _ => _buildInitial(routeSettings),
    };
  }

  static MaterialPageRoute _buildInitial(RouteSettings settings) {
    return MaterialPageRoute(
      builder: (_) => InitialFactory.build(),
    );
  }

  static MaterialPageRoute _buildAuth(RouteSettings settings) {
    return MaterialPageRoute(
      builder: (_) => AuthFactory.build(),
    );
  }

  static MaterialPageRoute _buildMain(RouteSettings settings) {
    return MaterialPageRoute(
      builder: (_) => MainFactory.build(),
    );
  }

  static MaterialPageRoute _buildHome(RouteSettings settings) {
    return MaterialPageRoute(
      builder: (_) => HomeFactory.build(),
    );
  }

  static MaterialPageRoute _buildProfile(RouteSettings settings) {
    return MaterialPageRoute(
      builder: (_) => ProfileFactory.build(),
    );
  }

  static MaterialPageRoute _buildLearn(RouteSettings settings) {
    return MaterialPageRoute(
      builder: (_) => LearnFactory.build(),
    );
  }
}
