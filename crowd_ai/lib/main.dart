import 'package:crowd_ai/Screens/management_home_screen.dart';
import 'package:crowd_ai/Screens/management_login_screen.dart';
import 'package:crowd_ai/Screens/police_home_screen.dart';
import 'package:crowd_ai/Screens/video_upload_screen.dart';
import 'package:crowd_ai/Screens/zone_selection_screen.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

// Screens
import 'Screens/welcome_screen.dart';
import 'Screens/police_login_screen.dart';
import 'navigation.dart'; // ✅ Contains AppRoutes & NavigationHelper

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // ✅ Initialize Firebase
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Crowd AI',
      theme: ThemeData(primarySwatch: Colors.blue),
      debugShowCheckedModeBanner: false,

      // ✅ Set the initial screen
      initialRoute: AppRoutes.WelcomeScreen,

      // ✅ Define named routes for navigation
      routes: {
        AppRoutes.WelcomeScreen: (context) => const WelcomeScreen(),
        AppRoutes.PoliceLoginScreen: (context) => const PoliceLoginScreen(),
        AppRoutes.managementLogin: (context) => const ManagementLoginScreen(),
          AppRoutes.policeHome: (context) => const PoliceHomeScreen(),
           AppRoutes.managementHome: (context) => const ManagementHomeScreen(),
             AppRoutes.videoUpload: (context) => const VideoUploadScreen(),
                AppRoutes.zoneSelection: (context) => const ZoneSelectionScreen(),
            


        // Uncomment and add other screens when ready
        // AppRoutes.managementLogin: (context) => const ManagementLoginScreen(),
        // AppRoutes.policeHome: (context) => const PoliceHomeScreen(),
        // AppRoutes.managementHome: (context) => const ManagementHomeScreen(),
        // AppRoutes.videoUpload: (context) => const VideoUploadScreen(),
        // AppRoutes.zoneSelection: (context) => const ZoneSelectionScreen(),
      },
    );
  }
}
