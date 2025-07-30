import 'package:flutter/material.dart';
import '../../navigation.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0A2239), // NYCC dark blue
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 32.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/nycc_logo.png', // Placeholder, replace with actual logo if available
                height: 100,
              ),
              const SizedBox(height: 40),
              const Text(
                'Welcome to SafeCrowd AI',
                style: TextStyle(
                  color: Color(0xFFF6F7EB), // NYCC light
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1.2,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 50),
              ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF1E5A99), // NYCC blue
                  padding: const EdgeInsets.symmetric(vertical: 18, horizontal: 32),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                ),
                icon: const Icon(Icons.local_police, color: Color(0xFFF6F7EB)),
                label: const Text(
                  'Police Login',
                  style: TextStyle(color: Color(0xFFF6F7EB), fontSize: 20),
                ),
                onPressed: () {
                  NavigationHelper.goToPoliceLogin(context);
                },
              ),
              const SizedBox(height: 30),
              ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF117864), // NYCC green
                  padding: const EdgeInsets.symmetric(vertical: 18, horizontal: 32),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                ),
                icon: const Icon(Icons.manage_accounts, color: Color(0xFFF6F7EB)),
                label: const Text(
                  'Management Login',
                  style: TextStyle(color: Color(0xFFF6F7EB), fontSize: 20),
                ),
                onPressed: () {
                  NavigationHelper.goToManagementLogin(context);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
