import 'package:flutter/material.dart';
import 'package:ro_shops/screens/home_screen.dart';

class HomeStack extends StatelessWidget {
  const HomeStack({super.key});

  @override
  Widget build(BuildContext context) {
    return Navigator(
      onGenerateRoute: (settings) {
        return MaterialPageRoute(builder: (_) => const HomeScreen());
      },
    );
  }
}
