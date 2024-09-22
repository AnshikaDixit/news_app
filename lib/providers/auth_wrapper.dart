import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:news_app/views/auth_flow/login.dart';
import 'package:news_app/views/dashboard/dashboard.dart';
import 'package:provider/provider.dart';
import '../services/auth_service.dart';

class AuthWrapper extends StatelessWidget {
  static const String route = "auth_screen";
  const AuthWrapper({super.key});

  @override
  Widget build(BuildContext context) {
    final authService = Provider.of<AuthService>(context);

    return StreamBuilder<User?>(
      stream: authService.authStateChanges,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.active) {
          final user = snapshot.data;
          return user == null ? const LoginScreen() : const DashboardScreen();
        } else {
          return const Scaffold(
            body: Center(child: CircularProgressIndicator()),
          );
        }
      },
    );
  }
}
