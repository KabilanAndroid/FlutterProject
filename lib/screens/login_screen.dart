import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ro_shops/config.dart';
import 'package:ro_shops/providers/mainprovider.dart';
import 'package:ro_shops/widgets/responsive_layout.dart';

class LoginScreen extends ConsumerStatefulWidget {
  const LoginScreen({super.key});

  @override
  ConsumerState<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends ConsumerState<LoginScreen> {
  
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final dio = Dio();

  String get _baseUrl => AppConfig.baseUrl;
  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  void handlelogin() async {
    if (emailController.text.isNotEmpty && passwordController.text.isNotEmpty) {
      try {
        final response = await dio.post(
          '$_baseUrl/api/auth/login',
          data: {
            'email': emailController.text,
            'password': passwordController.text,
          },
        );
        if (mounted) {
          if (response.statusCode == 200) {
            debugPrint(response.data.toString());
            final prefs = ref.read(sharedPreferencesProvider);
            await prefs.setString('username', response.data['user']['name']);
            await prefs.setString('id', response.data['user']['id']);
            await prefs.setString('email', response.data['user']['email']);
            await prefs.setBool('isLoggedIn', true);
            ref.read(usernameProvider.notifier).state = response.data['user']['name'];
            ref.read(idProvider.notifier).state = response.data['user']['id'];
            ref.read(emailProvider.notifier).state = response.data['user']['email'];
            ref.read(isLoggedInProvider.notifier).state = true;
          }
        }
      } catch (e) {
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Login failed'), backgroundColor: Colors.red),
          );
        }
      }
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please fill all fields correctly'), backgroundColor: Colors.orange),
      );
    }
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: ResponsiveLayout(
        child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Padding(
            padding: EdgeInsets.only(bottom: 32),
            child: Text(
              'Login',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 20),
            child: TextField(
              controller: emailController,
              keyboardType: TextInputType.emailAddress,
              decoration: responsiveInputDecoration('Email'),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 20),
            child: TextField(
              controller: passwordController,
              obscureText: true,
              decoration: responsiveInputDecoration('Password'),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 16),
            child: ElevatedButton(
              onPressed: handlelogin,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.deepPurple,
                minimumSize: const Size(double.infinity, 52),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
              ),
              child: const Text('Login', style: TextStyle(color: Colors.white, fontSize: 16)),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text("Don't have an account?"),
              TextButton(
                onPressed: () => Navigator.pushNamed(context, '/signup'),
                child: const Text('Sign Up', style: TextStyle(color: Colors.deepPurple)),
              ),
            ],
          ),
        ],
        ),
      ),
    );
  }
}
