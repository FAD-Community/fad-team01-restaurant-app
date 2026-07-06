import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ka3da/core/theme/colors.dart';
import 'package:ka3da/features/auth/presentation/widgets/forget_password/forget_password_form.dart';
import 'package:ka3da/features/auth/presentation/widgets/forget_password/forget_password_header.dart';
import 'package:ka3da/features/auth/presentation/widgets/forget_password/forget_password_progress.dart';

class ForgetPasswordScreen extends StatelessWidget {
  const ForgetPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.scaffoldBackground,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(
            horizontal: 24.w,
            vertical: 16.h,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const ForgetPasswordProgress(),

              SizedBox(height: 40.h),

              const ForgetPasswordHeader(),

              SizedBox(height: 32.h),

              const ForgetPasswordForm(),
            ],
          ),
        ),
      ),
    );
  }
}