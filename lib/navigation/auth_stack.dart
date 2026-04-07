import 'package:flutter/material.dart';
import 'package:ro_shops/screens/login_screen.dart';
import 'package:ro_shops/screens/signup_screen.dart';

class AuthStack extends StatelessWidget {
  const AuthStack({super.key});

  @override
  Widget build(BuildContext context) {
    return Navigator(
      onGenerateRoute: (settings) {
        switch (settings.name) {
          case '/signup':
            return MaterialPageRoute(builder: (_) => const SignupScreen());
          default:
            return MaterialPageRoute(builder: (_) => const LoginScreen());
        }
      },
    );
  }
}
