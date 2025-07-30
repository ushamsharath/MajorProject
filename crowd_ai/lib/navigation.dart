import 'package:flutter/material.dart';
import 'Screens/welcome_screen.dart';
import 'Screens/police_login_screen.dart';

// Route names
class AppRoutes {
  static const String WelcomeScreen = '/welcome';
  static const String PoliceLoginScreen = '/police-login';
  static const String managementLogin = '/management-login';
  static const String policeHome = '/police-home';
  static const String managementHome = '/management-home';
  static const String videoUpload = '/video-upload';
  static const String zoneSelection = '/zone-selection';
}

// Navigation helpers
class NavigationHelper {
  static void goToWelcome(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.WelcomeScreen);
  }

  static void goToPoliceLogin(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.PoliceLoginScreen);
  }

  static void goToManagementLogin(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.managementLogin);
  }

  static void goToPoliceHome(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.policeHome);
  }

  static void goToManagementHome(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.managementHome);
  }

  static void goToVideoUpload(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.videoUpload);
  }

  static void goToZoneSelection(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.zoneSelection);
  }
}
