import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ka3da/core/routing/app_routes.dart';
import 'package:ka3da/core/theme/colors.dart';
import 'package:ka3da/core/theme/text_styles.dart';
import 'package:ka3da/core/widgets/custom_back_button.dart';

class LoginHeader extends StatelessWidget {
  const LoginHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
           CustomBackButton(),


        SizedBox(height: 24.h),

        Text(
          'Welcome Back',
          style: AppTextStyles.h1.copyWith(
            color: AppColors.darkBackground
          ),
        ),

        SizedBox(height: 4.h),

        Text(
          'Sign in to continue your dining journey.',
          style: AppTextStyles.body.copyWith(
            color: AppColors.darkerBackground,
          ),
        ),
      ],
    );
  }
}