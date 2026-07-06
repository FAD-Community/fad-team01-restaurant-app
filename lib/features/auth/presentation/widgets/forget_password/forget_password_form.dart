import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ka3da/core/routing/app_routes.dart';
import 'package:ka3da/core/theme/colors.dart';
import 'package:ka3da/core/theme/text_styles.dart';
import 'package:ka3da/core/widgets/custom_button.dart';

class ForgetPasswordForm extends StatelessWidget {
  const ForgetPasswordForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Align(
          alignment: Alignment.centerLeft,
          child: Text(
            'Email Address',
            style: AppTextStyles.body,
          ),
        ),

        SizedBox(height: 8.h),

        Container(
          decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.circular(16.r),
          ),
          child: TextField(
            keyboardType: TextInputType.emailAddress,
            style: AppTextStyles.bodyMedium,
            decoration: InputDecoration(
              hintText: 'Enter your email',
              hintStyle: AppTextStyles.bodyMedium.copyWith(
                color: AppColors.textHint,
              ),
              prefixIcon: Icon(
                Icons.mail_outline,
                color: AppColors.textHint,
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16.r),
                borderSide: BorderSide.none,
              ),
              filled: true,
              fillColor: AppColors.white,
            ),
          ),
        ),

        SizedBox(height: 32.h),

        CustomButton(
          backgroundColor: AppColors.primary,
          onPressed: () {
            Navigator.pushNamed(
              context,
              AppRoutes.otpScreen,
            );
          },
          child: Text(
            'Send Code',
            style: AppTextStyles.bodySemiBold.copyWith(
              color: AppColors.white,
            ),
          ),
        ),
      ],
    );
  }
}
