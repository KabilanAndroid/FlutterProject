import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:ro_shops/config.dart';
import 'package:ro_shops/screens/home_screen.dart';
import 'package:ro_shops/screens/signup_screen.dart';
import 'package:ro_shops/widgets/responsive_layout.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
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
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Login successful'), backgroundColor: Colors.green),
            );
            Navigator.push(context, MaterialPageRoute(builder: (context) => HomeScreen()));
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
    return ResponsiveLayout(
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
                onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SignupScreen()),
                ),
                child: const Text('Sign Up', style: TextStyle(color: Colors.deepPurple)),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
