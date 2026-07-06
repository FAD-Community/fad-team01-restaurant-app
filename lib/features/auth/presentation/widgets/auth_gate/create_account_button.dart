import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:ka3da/core/routing/app_routes.dart';
import 'package:ka3da/core/theme/colors.dart';
import 'package:ka3da/core/theme/text_styles.dart';
import 'package:ka3da/core/widgets/custom_button.dart';

class CreateAccountButton extends StatelessWidget {
  const CreateAccountButton({super.key});

  void _navigate(BuildContext context) {
    Navigator.pushNamed(
      context,
      AppRoutes.createAccountScreen,
    );
  }

  @override
  Widget build(BuildContext context) {
    return CustomButton(
      onPressed: () => _navigate(context),
      backgroundColor: AppColors.primary,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.mail_outline,
            color: AppColors.white,
            size: 22.sp,
          ),
          SizedBox(width: 12.w),
          Text(
            'Create Account',
            style: AppTextStyles.body.copyWith(
              color: AppColors.white,

            ),
          ),
        ],
      ),
    );
  }
}