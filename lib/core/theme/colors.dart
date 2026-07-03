import 'package:flutter/material.dart';

/// Centralized color constants for the entire app.
/// Use these instead of hardcoded Color values throughout the codebase.
class AppColors {
  AppColors._(); // Prevent instantiation

  // ============================================================
  // Primary Colors
  // ============================================================

  /// Main brand red - used for primary buttons, active indicators, links
  static const Color primary = Color(0xFF8B2527);

  /// Active dot red - used for page indicators
  static const Color primaryDot = Color(0xFF9E2A2B);

  /// Brownish accent - used for "Forgot Password", "Resend Code" links
  static const Color accent = Color(0xFFB56A54);

  /// Success green - used for OTP border, success states
  static const Color success = Color(0xFF4CAF50);

  // ============================================================
  // Background Colors
  // ============================================================

  /// Main beige background used across all screens
  static const Color scaffoldBackground = Color(0xFFF5F1E8);

  /// Alternative beige background (used in main.dart theme)
  static const Color scaffoldBackgroundAlt = Color(0xFFFAF3E6);

  /// Dark background - used for onboarding, auth gate top section
  static const Color darkBackground = Color(0xFF1E1A17);

  /// Darker background variant - used for onboarding gradient
  static const Color darkerBackground = Color(0xFF181512);

  /// White background - used for text fields, social buttons, bottom sheets
  static const Color white = Colors.white;

  /// Transparent
  static const Color transparent = Colors.transparent;

  /// Light grey divider color
  static Color divider = Colors.grey.shade300;

  // ============================================================
  // Surface Colors
  // ============================================================

  /// Card/AppBar white background
  static const Color surfaceWhite = Color(0xffFFFEFC);

  /// Profile menu item background
  static const Color surfaceLight = Color(0xffF9F2E7);

  /// Divider/separator color in profile
  static const Color surfaceDivider = Color(0xffEFE7DA);

  /// Settings separator
  static const Color surfaceSeparator = Color(0xffF2ECE4);

  // ============================================================
  // Progress Bar Colors
  // ============================================================

  /// Inactive progress bar step
  static const Color progressInactive = Color(0xFFE2DACC);

  /// Active progress bar step (same as primary)
  static const Color progressActive = primary;

  // ============================================================
  // Button Colors
  // ============================================================

  /// Disabled button background
  static const Color buttonDisabled = Color(0xFFDFD4C5);

  // ============================================================
  // Text Colors
  // ============================================================

  /// Primary dark text - titles, headings
  static const Color textDark = Color(0xff261C14);

  /// Dark brown/black text
  static const Color textDarkBrown = Color(0xff1A130D);

  /// Secondary text color
  static const Color textSecondary = Color(0xff8A8178);

  /// Muted text color
  static const Color textMuted = Color(0xff6E6259);

  /// Hint/placeholder text color
  static const Color textHint = Color(0xff6A625B);

  /// Another hint variant
  static const Color textHintAlt = Color(0xff4A443F);

  /// Form hint color (used in edit profile)
  static const Color textFormHint = Color(0xff473426);

  // ============================================================
  // Miscellaneous
  // ============================================================

  /// Gold/Yellow badge color (profile)
  static const Color gold = Color(0xffFFD54C);
}
