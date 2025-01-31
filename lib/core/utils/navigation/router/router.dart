import 'package:dsa_learning/core/constants/routes.dart';
import 'package:dsa_learning/presentation/home/home_factory.dart';
import 'package:dsa_learning/presentation/profile/profile_factory.dart';
import 'package:flutter/material.dart';

class AppRouter {
  static Route? onGenerateRoute(RouteSettings routeSettings) {
    return switch (routeSettings.name) {
      AppRoutes.routeHome => _buildHome(routeSettings),
      AppRoutes.routeProfile => _buildProfile(routeSettings),
      _ => _buildHome(routeSettings),
    };
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
}
