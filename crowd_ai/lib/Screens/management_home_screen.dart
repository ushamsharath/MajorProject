import 'package:flutter/material.dart';
import '../../navigation.dart';

class ManagementHomeScreen extends StatelessWidget {
  const ManagementHomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0A2239),
      appBar: AppBar(
        backgroundColor: const Color(0xFF117864),
        title: const Text('Management Dashboard'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(32.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.manage_accounts, size: 72, color: Color(0xFF117864)),
              const SizedBox(height: 30),
              const Text(
                'Welcome, Management!',
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
                  backgroundColor: const Color(0xFF117864),
                  padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 40),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                onPressed: () {
                  NavigationHelper.goToZoneSelection(context);
                },
                child: const Text('Set Zone & Slot Limit', style: TextStyle(fontSize: 18, color: Color(0xFFF6F7EB))),
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF117864),
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
