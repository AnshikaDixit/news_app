import 'package:flutter/material.dart';
import 'package:news_app/providers/auth_wrapper.dart';
import 'package:news_app/views/auth_flow/login.dart';
import 'package:news_app/views/auth_flow/sign_up.dart';
import 'package:news_app/views/dashboard/dashboard.dart';


class Routes {
  static Route<dynamic>? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case SignupScreen.route:
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => const SignupScreen(),
        );
      case LoginScreen.route:
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => const LoginScreen(),
        );
      case DashboardScreen.route:
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => const DashboardScreen(),
        );
      case AuthWrapper.route:
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => const AuthWrapper(),
        );
      default:
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => Scaffold(
            body: Center(
              child: Text('No route defined for ${settings.name}'),
            ),
          ),
        );
    }
  }
}