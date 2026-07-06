import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ka3da/core/routing/app_routes.dart';
import 'package:ka3da/core/theme/colors.dart';
import 'package:ka3da/core/theme/text_styles.dart';
import 'package:ka3da/core/widgets/custom_back_button.dart';
import 'package:ka3da/core/widgets/custom_button.dart';

class CreateAccountHeader extends StatelessWidget {
  const CreateAccountHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
      CustomBackButton(),
        SizedBox(height: 24.h),

        Text(
          'Create Account',
          style: AppTextStyles.h1.copyWith(color: AppColors.darkBackground),
        ),

        SizedBox(height: 4.h),

        Text(
          'Join now to start booking your dream dining experiences.',
          style: AppTextStyles.bodyMedium.copyWith(
            color: AppColors.textSecondary,
          ),
        ),
      ],
    );
  }
}