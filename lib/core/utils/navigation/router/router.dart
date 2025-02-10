import 'package:dsa_learning/core/constants/routes.dart';
import 'package:dsa_learning/presentation/main/home/home_factory.dart';
import 'package:dsa_learning/presentation/main/learn/learn_factory.dart';
import 'package:dsa_learning/presentation/main/profile/profile_factory.dart';
import 'package:dsa_learning/presentation/main_factory.dart';
import 'package:flutter/material.dart';

class AppRouter {
  static Route? onGenerateRoute(RouteSettings routeSettings) {
    return switch (routeSettings.name) {
      AppRoutes.routeMain => _buildMain(routeSettings),
      AppRoutes.routeHome => _buildHome(routeSettings),
      AppRoutes.routeLearn => _buildLearn(routeSettings),
      AppRoutes.routeProfile => _buildProfile(routeSettings),
      _ => _buildHome(routeSettings),
    };
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
