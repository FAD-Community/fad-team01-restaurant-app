import 'package:flutter/material.dart';
import 'package:ka3da/features/intro/presentation/screens/splash_screen.dart';
import 'package:ka3da/features/profile/presentation/screens/profile_screen.dart';
import 'package:ka3da/features/profile/presentation/screens/edit_profile_screen.dart';
import 'package:ka3da/features/layout/presentation/screens/main_layout.dart';

class AppRoutes {
  static const String splash = '/';
  static const String mainLayout = '/mainLayout';
  static const String profile = '/profile';
  static const String editProfile = '/editProfile';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case splash:
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => const SplashScreen(),
        );

      case mainLayout:
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => const MainLayout(),
        );

      case profile:
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => const ProfileScreen(),
        );

      case editProfile:
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => const EditProfileScreen(),
        );

      //==============================================================================
      default:
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => const Scaffold(
            body: Center(
              child: Text('Screen does not exist!'),
            ),
          ),
        );
    }
  }
}
