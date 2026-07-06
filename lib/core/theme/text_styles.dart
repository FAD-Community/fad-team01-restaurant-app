import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'colors.dart';

class AppTextStyles {
  AppTextStyles._();

  //==========================
  // Font Families
  //==========================

static const String bodyFont = 'PlusJakartaSans';
static const String heroFont = 'DMSerifDisplay';
  //==========================
  // Hero
  //==========================

  static TextStyle hero = TextStyle(
    fontFamily: heroFont,
    fontSize: 36.sp,
    fontWeight: FontWeight.w400,
    color: AppColors.textDark,
    height: 1.2,
  );


  //==========================
  // Headings
  //==========================

  static TextStyle h1 = TextStyle(
    fontFamily: bodyFont,
    fontSize: 25.sp,
    fontWeight: FontWeight.w700,
    color:  Color.fromARGB(255, 255, 255, 255),
  );

  static TextStyle h2 = TextStyle(
    fontFamily: bodyFont,
    fontSize: 20.sp,
    fontWeight: FontWeight.w700,
    color: AppColors.textDark,
  );

  //==========================
  // Paragraph
  //==========================

  static TextStyle body = TextStyle(
    fontFamily: bodyFont,
    fontSize: 16.sp,
    fontWeight: FontWeight.w400,
    color: AppColors.textDark,
    height: 1.5,
  );

  static TextStyle bodyMedium = TextStyle(
    fontFamily: bodyFont,
    fontSize: 16.sp,
    fontWeight: FontWeight.w500,
    color: AppColors.textDark,
  );

  static TextStyle bodySemiBold = TextStyle(
    fontFamily: bodyFont,
    fontSize: 16.sp,
    fontWeight: FontWeight.w600,
    color: AppColors.textDark,
  );

  //==========================
  // Caption
  //==========================

  static TextStyle caption = TextStyle(
    fontFamily: bodyFont,
    fontSize: 13.sp,
    fontWeight: FontWeight.w300,
    color: AppColors.textSecondary,
  );
  static TextStyle captionMedium = TextStyle(
    fontFamily: bodyFont,
    fontSize: 13.sp,
    fontWeight: FontWeight.w400,
    color: AppColors.textSecondary,
  );

  static TextStyle captionlarge = TextStyle(
    fontFamily: bodyFont,
    fontSize: 13.sp,
    fontWeight: FontWeight.w500,
    color: AppColors.textSecondary,
  );

  //==========================
  // Inline
  //==========================

  static TextStyle inline = TextStyle(
    fontFamily: bodyFont,
    fontSize: 10.sp,
    fontWeight: FontWeight.w200,
    color: AppColors.textSecondary,
  );

  //==========================
  // Buttons
  //==========================

  static TextStyle button = TextStyle(
    fontFamily: bodyFont,
    fontSize: 16.sp,
    fontWeight: FontWeight.w600,
    color: Colors.white,
  );

  //==========================
  // TextField
  //==========================

  static TextStyle input = TextStyle(
    fontFamily: bodyFont,
    fontSize: 16.sp,
    fontWeight: FontWeight.w400,
    color: const Color.fromARGB(255, 255, 255, 255),
  );

  static TextStyle hint = TextStyle(
    fontFamily: bodyFont,
    fontSize: 16.sp,
    fontWeight: FontWeight.w400,
    color: AppColors.textHint,
  );

  static TextStyle label = TextStyle(
    fontFamily: bodyFont,
    fontSize: 16.sp,
    fontWeight: FontWeight.w500,
    color: AppColors.textDark,
  );

  //==========================
  // Links
  //==========================

  static TextStyle link = TextStyle(
    fontFamily: bodyFont,
    fontSize: 16.sp,
    fontWeight: FontWeight.w600,
    color: AppColors.primary,
  );
  static TextStyle subtitle = TextStyle(
    fontFamily: bodyFont,
    fontSize: 10.sp,
    fontWeight: FontWeight.w200,
    color: AppColors.primary,
  );

  static TextStyle? get bodySecondary => null;
}