import 'package:flutter/material.dart';
import 'package:ka3da/features/auth/presentation/screens/auth_gate_screen.dart';
import 'package:ka3da/features/auth/presentation/screens/create_account_screen.dart';
import 'package:ka3da/features/auth/presentation/screens/create_new_password_screen.dart';
import 'package:ka3da/features/auth/presentation/screens/forget_password_screen.dart';
import 'package:ka3da/features/auth/presentation/screens/login_screen.dart';
import 'package:ka3da/features/home/presentation/screens/home_screen.dart';
import 'package:ka3da/features/home/presentation/screens/restaurant_detail.dart';
import 'package:ka3da/features/home/presentation/screens/reserve_table_screen.dart';
import 'package:ka3da/features/home/presentation/screens/review_reservation_screen.dart';
import 'package:ka3da/features/home/presentation/screens/deposit_payment_screen.dart';
import 'package:ka3da/features/notifications/presentation/screens/notifications_screen.dart';
import 'package:ka3da/features/intro/presentation/screens/onboarding_screen.dart';
import 'package:ka3da/features/intro/presentation/screens/splash_screen.dart';
import 'package:ka3da/features/auth/presentation/screens/otp_screen.dart';
import 'package:ka3da/features/nearby/presentation/screens/mapscreen.dart';
import 'package:ka3da/features/nearby/presentation/screens/nearby.dart';
import 'package:ka3da/features/nearby/data/models/card_model.dart';
import 'package:ka3da/features/profile/presentation/screens/change_password/change_password_screen.dart';
import 'package:ka3da/features/profile/presentation/screens/privacy_policy_screen.dart';
import 'package:ka3da/features/profile/presentation/screens/profile/profile_screen.dart';
import 'package:ka3da/features/profile/presentation/screens/edit_profile/edit_profile_screen.dart';
import 'package:ka3da/features/layout/presentation/screens/main_layout.dart';
import 'package:ka3da/features/profile/presentation/screens/settings/settings_screen.dart';

class AppRoutes {
  static const String splash = '/';
  static const String mainLayout = '/mainLayout';
  static const String home = '/home';
  static const String profile = '/profile';
  static const String editProfile = '/editProfile';
  static const String settingspage = '/sttings';
  static const String changePassword = '/changePassword';
  static const String privacyPolicyScreen = '/privacyPolicyScreen';
  static const String onboardingscreen = '/onboarding';
  static const String authGateScreen = '/authGateScreen';
  static const String createAccountScreen = '/createAccountScreen';
  static const String loginscreen = '/loginscreen';
  static const String forgetPasswordScreen = '/forgetPasswordScreen';
  static const String otpScreen = '/otpScreen';
  static const String createNewPasswordScreen = '/createNewPasswordScreen';
  static const String restaurantDetailsScreen = '/restaurantDetailsScreen';
  static const String reserveTabelScreen = '/reserveTabelScreen';
  static const String reviewReservationScreen = '/reviewReservationScreen';
  static const String depositPaymentScreen = '/depositPaymentScreen';
  static const String notificationsScreen = '/notificationsScreen';

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
      case authGateScreen:
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => const AuthGateScreen(),
        );
      case createAccountScreen:
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => const CreateAccountScreen(),
        );
      case loginscreen:
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => const LoginScreen(),
        );
      case forgetPasswordScreen:
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => const ForgetPasswordScreen(),
        );
      case otpScreen:
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => const OtpScreen(),
        );
      case createNewPasswordScreen:
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => const CreateNewPasswordScreen(),
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
      case restaurantDetailsScreen:
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => const RestaurantDetails(),
        );
      case reserveTabelScreen:
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => const ReserveTableScreen(),
        );
      case reviewReservationScreen:
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => const ReviewReservationScreen(),
        );
      case depositPaymentScreen:
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => const DepositPaymentScreen(),
        );
      case notificationsScreen:
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => const NotificationsScreen(),
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
