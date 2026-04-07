import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ro_shops/navigation/auth_stack.dart';
import 'package:ro_shops/navigation/home_stack.dart';
import 'package:ro_shops/providers/mainprovider.dart';

void main() {
  runApp(
    const ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isLoggedIn = ref.watch(isLoggedInProvider);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: isLoggedIn ? const HomeStack() : const AuthStack(),
    );
  }
}
