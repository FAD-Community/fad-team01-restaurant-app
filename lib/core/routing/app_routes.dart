import 'package:flutter/material.dart';
import 'package:ka3da/features/home/presentation/screens/home_screen.dart';
import 'package:ka3da/features/intro/presentation/screens/splash_screen.dart';
import 'package:ka3da/features/profile/presentation/screens/about_screen.dart';
import 'package:ka3da/features/profile/presentation/screens/change_password_screen.dart';
import 'package:ka3da/features/profile/presentation/screens/support_screen.dart';
import 'package:ka3da/features/profile/presentation/screens/privacy_policy_screen.dart';
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
  static const String aboutQa3da = '/aboutQa3da';
  static const String supportScreen = '/supportScreen';
  static const String changePassword = '/changePassword';
  static const String privacyPolicyScreen = '/privacyPolicyScreen';

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
      case changePassword:
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => const ChangePasswordScreen(),
        );
      case privacyPolicyScreen:
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => const PrivacyPolicyScreen(),
        );
      case aboutQa3da:
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => const AboutScreen(),
        );
      case supportScreen:
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => const SupportScreen(),
        );

      //==============================================================================
      default:
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => const Scaffold(
            body: Center(child: Text('Screen does not exist!')),
          ),
        );
    }
  }
}
