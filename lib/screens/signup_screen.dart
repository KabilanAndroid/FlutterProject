import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:ro_shops/config.dart';
import 'package:ro_shops/screens/login_screen.dart';
import 'package:ro_shops/widgets/responsive_layout.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final usernameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmpassController = TextEditingController();
  final dio = Dio();

  String get _baseUrl => AppConfig.baseUrl;

  @override
  void dispose() {
    usernameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    confirmpassController.dispose();
    super.dispose();
  }

  bool validate() {
    if (usernameController.text.isEmpty ||
        emailController.text.isEmpty ||
        passwordController.text.isEmpty ||
        confirmpassController.text.isEmpty) {
      return false;
    }
    if (passwordController.text != confirmpassController.text) return false;
    return true;
  }

  void handlesignup() async {
    if (validate()) {
      try {
        final response = await dio.post(
          '$_baseUrl/api/auth/signup',
          data: {
            'name': usernameController.text,
            'email': emailController.text,
            'password': passwordController.text,
          },
        );
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(response.data['message'] ?? 'Signup successful!'),
              backgroundColor: Colors.green,
            ),
          );
          if (response.data['message'] == 'User registered successfully') {
            Navigator.push(context, MaterialPageRoute(builder: (context) => LoginScreen()));
          }
        }
      } catch (error) {
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Signup failed'), backgroundColor: Colors.red),
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
              'Sign Up',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 20),
            child: TextField(
              controller: usernameController,
              decoration: responsiveInputDecoration('Username'),
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
            padding: const EdgeInsets.only(bottom: 20),
            child: TextField(
              controller: confirmpassController,
              obscureText: true,
              decoration: responsiveInputDecoration('Confirm Password'),
            ),
          ),
          ElevatedButton(
            onPressed: handlesignup,
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.deepPurple,
              minimumSize: const Size(double.infinity, 52),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            ),
            child: const Text('Sign Up', style: TextStyle(color: Colors.white, fontSize: 16)),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text('Already have an account?'),
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: const Text('Login', style: TextStyle(color: Colors.deepPurple)),
              ),
            ],
          ),
        ],
        ),
      ),
    );
  }
}
