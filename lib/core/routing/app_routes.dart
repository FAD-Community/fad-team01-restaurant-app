import 'package:flutter/material.dart';
import 'package:ka3da/features/home/presentation/screens/home_screen.dart';
import 'package:ka3da/features/intro/presentation/screens/on_boarding_screen.dart';
import 'package:ka3da/features/intro/presentation/screens/splash_screen.dart';
import 'package:ka3da/features/profile/presentation/screens/profile_screen.dart';
import 'package:ka3da/features/profile/presentation/screens/edit_profile_screen.dart';
import 'package:ka3da/features/layout/presentation/screens/main_layout.dart';
import 'package:ka3da/features/profile/presentation/screens/settings_screen.dart';

class AppRoutes {
  static const String splash = '/';
  static const String mainLayout = '/mainLayout';
  static const String home = '/home';
  static const String profile = '/profile';
  static const String editProfile = '/editProfile';
  static const String settingspage = '/sttings';
  static const String onboardingscreen = '/onboarding';

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
      case home:
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => const HomeScreen(),
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

      case settingspage:
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => const SettingsScreen(),
        );
      case onboardingscreen:
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => const OnBoardingScreen(),
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
