import 'package:flutter/material.dart';
import '../../navigation.dart';

class PoliceHomeScreen extends StatelessWidget {
  const PoliceHomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0A2239),
      appBar: AppBar(
        backgroundColor: const Color(0xFF1E5A99),
        title: const Text('Police Dashboard'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(32.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.local_police, size: 72, color: Color(0xFF1E5A99)),
              const SizedBox(height: 30),
              const Text(
                'Welcome, Police Officer!',
                style: TextStyle(
                  color: Color(0xFFF6F7EB),
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 24),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF1E5A99),
                  padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 40),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                onPressed: () {
                  NavigationHelper.goToVideoUpload(context);
                },
                child: const Text('Upload Crowd Video', style: TextStyle(fontSize: 18, color: Color(0xFFF6F7EB))),
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF1E5A99),
                  padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 40),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                onPressed: () {
                  Navigator.pushNamed(context, '/logs');
                },
                child: const Text('View Logs', style: TextStyle(fontSize: 18, color: Color(0xFFF6F7EB))),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
