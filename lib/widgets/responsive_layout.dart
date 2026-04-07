import 'package:flutter/material.dart';

class ResponsiveLayout extends StatelessWidget {
  final Widget child;
  const ResponsiveLayout({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final isWide = width >= 600;
    debugPrint("width:${width}");

    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Container(
            width: isWide ? 480 : double.infinity,
            margin: isWide ? const EdgeInsets.symmetric(vertical: 40) : EdgeInsets.zero,
            padding: EdgeInsets.symmetric(
              horizontal: isWide ? 48 : 32,
              vertical: 40,
            ),
            decoration: isWide
                ? BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(24),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black12,
                        blurRadius: 24,
                        offset: Offset(0, 8),
                      ),
                    ],
                  )
                : null,
            child: child,
          ),
        ),
      ),
    );
  }
}

InputDecoration responsiveInputDecoration(String hint) {
  return InputDecoration(
    hintText: hint,
    contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(20),
      borderSide: const BorderSide(color: Colors.grey),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(20),
      borderSide: const BorderSide(color: Colors.deepPurple, width: 2),
    ),
  );
}
