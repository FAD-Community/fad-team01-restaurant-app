import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ka3da/core/theme/colors.dart';

/// Centralized text styles for the entire app.
/// Uses DM Sans as the primary font and Playfair Display for display/brand text.
class AppTextStyles {
  AppTextStyles._(); // Prevent instantiation

  // ============================================================
  // Base Font Families
  // ============================================================

  /// Primary font family - DM Sans (body, labels, buttons)
  static String get _primaryFont => GoogleFonts.dmSans().fontFamily!;

  /// Display font family - Playfair Display (brand name, headings)
  static String get _displayFont => GoogleFonts.playfairDisplay().fontFamily!;

  // ============================================================
  // Display / Brand Styles (Playfair Display)
  // ============================================================

  /// App brand name style (e.g., "Qa3da" on auth gate)
  static TextStyle get displayLarge => GoogleFonts.playfairDisplay(
        fontSize: 48.sp,
        fontWeight: FontWeight.w700,
        color: Colors.white,
      );

  /// Onboarding heading style
  static TextStyle get displayMedium => GoogleFonts.playfairDisplay(
        fontSize: 38.sp,
        fontWeight: FontWeight.w700,
        color: Colors.white,
      );

  // ============================================================
  // Heading Styles (DM Sans)
  // ============================================================

  /// Large heading - screen titles (e.g., "Welcome Back", "Create Account")
  static TextStyle get headingLarge => GoogleFonts.dmSans(
        fontSize: 28.sp,
        fontWeight: FontWeight.bold,
        color: Colors.black,
      );

  /// Medium heading - section titles (e.g., "Forget Password?", "Enter Code")
  static TextStyle get headingMedium => GoogleFonts.dmSans(
        fontSize: 24.sp,
        fontWeight: FontWeight.bold,
        color: Colors.black,
      );

  /// Small heading - dialog titles (e.g., "Password Updated!")
  static TextStyle get headingSmall => GoogleFonts.dmSans(
        fontSize: 20.sp,
        fontWeight: FontWeight.bold,
        color: Colors.black,
      );

  // ============================================================
  // Body Styles (DM Sans)
  // ============================================================

  /// Body large - subtitle text, descriptions
  static TextStyle get bodyLarge => GoogleFonts.dmSans(
        fontSize: 16.sp,
        fontWeight: FontWeight.normal,
        color: Colors.black87,
      );

  /// Body medium - general body text, form labels
  static TextStyle get bodyMedium => GoogleFonts.dmSans(
        fontSize: 14.sp,
        fontWeight: FontWeight.normal,
        color: Colors.black87,
      );

  /// Body small - captions, helper text
  static TextStyle get bodySmall => GoogleFonts.dmSans(
        fontSize: 13.sp,
        fontWeight: FontWeight.normal,
        color: Colors.black54,
      );

  // ============================================================
  // Button Styles (DM Sans)
  // ============================================================

  /// Primary button text (e.g., "Sign in", "Send Code")
  static TextStyle get buttonLarge => GoogleFonts.dmSans(
        fontSize: 16.sp,
        fontWeight: FontWeight.w600,
        color: Colors.white,
      );

  /// Secondary button text
  static TextStyle get buttonMedium => GoogleFonts.dmSans(
        fontSize: 14.sp,
        fontWeight: FontWeight.w600,
        color: Colors.white,
      );

  // ============================================================
  // Label Styles (DM Sans)
  // ============================================================

  /// Form field labels (e.g., "Email Address", "Password")
  static TextStyle get label => GoogleFonts.dmSans(
        fontSize: 14.sp,
        fontWeight: FontWeight.w500,
        color: Colors.black87,
      );

  /// Hint text inside text fields
  static TextStyle get hint => GoogleFonts.dmSans(
        fontSize: 14.sp,
        fontWeight: FontWeight.normal,
        color: Colors.grey.shade400,
      );

  /// Input text inside text fields
  static TextStyle get input => GoogleFonts.dmSans(
        fontSize: 14.sp,
        fontWeight: FontWeight.normal,
        color: Colors.black87,
      );

  // ============================================================
  // Link Styles (DM Sans)
  // ============================================================

  /// Primary link (e.g., "Create Account", "Sign in" at bottom)
  static TextStyle get linkPrimary => GoogleFonts.dmSans(
        fontSize: 14.sp,
        fontWeight: FontWeight.w600,
        color: AppColors.primary,
        decoration: TextDecoration.underline,
        decorationColor: AppColors.primary,
      );

  /// Accent link (e.g., "Forgot Password?", "Resent Code")
  static TextStyle get linkAccent => GoogleFonts.dmSans(
        fontSize: 13.sp,
        fontWeight: FontWeight.w500,
        color: AppColors.accent,
      );

  /// Accent link with underline
  static TextStyle get linkAccentUnderline => GoogleFonts.dmSans(
        fontSize: 13.sp,
        fontWeight: FontWeight.w500,
        color: AppColors.accent,
        decoration: TextDecoration.underline,
        decorationColor: AppColors.accent,
      );

  // ============================================================
  // Subtitle / Description Styles
  // ============================================================

  /// Screen subtitle (e.g., "Sign in to continue your dining journey.")
  static TextStyle get subtitle => GoogleFonts.dmSans(
        fontSize: 14.sp,
        fontWeight: FontWeight.normal,
        color: Colors.grey.shade700,
        height: 1.4,
      );

  /// Onboarding description text
  static TextStyle get onboardingDescription => GoogleFonts.dmSans(
        fontSize: 16.sp,
        fontWeight: FontWeight.normal,
        color: Colors.white.withValues(alpha: 0.8),
        height: 1.5,
      );

  /// Auth gate description (white on dark)
  static TextStyle get descriptionLight => GoogleFonts.dmSans(
        fontSize: 16.sp,
        fontWeight: FontWeight.normal,
        color: Colors.white.withValues(alpha: 0.9),
        height: 1.5,
      );

  // ============================================================
  // Divider / Separator Text
  // ============================================================

  /// Divider text (e.g., "or continue with")
  static TextStyle get dividerText => GoogleFonts.dmSans(
        fontSize: 14.sp,
        fontWeight: FontWeight.normal,
        color: Colors.grey.shade600,
      );

  // ============================================================
  // OTP Style
  // ============================================================

  /// OTP field text
  static TextStyle get otpField => GoogleFonts.dmSans(
        fontSize: 24.sp,
        fontWeight: FontWeight.bold,
        color: Colors.black,
      );
}
