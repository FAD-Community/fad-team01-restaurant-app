import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ka3da/core/routing/app_routes.dart';
import 'package:ka3da/core/theme/colors.dart';
import 'package:ka3da/core/theme/text_styles.dart';
import 'package:ka3da/core/widgets/custom_button.dart';

void showPasswordUpdatedBottomSheet(BuildContext context) {
  showModalBottomSheet(
    context: context,
    isDismissible: false,
    enableDrag: false,
    isScrollControlled: true,
    backgroundColor: Colors.transparent,
    builder: (_) {
      return Container(
        width: double.infinity,
        padding: EdgeInsets.fromLTRB(
          24.w,
          40.h,
          24.w,
          40.h + MediaQuery.of(context).padding.bottom,
        ),
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(32.r),
          ),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SvgPicture.asset(
              'assets/splash/check_icon.svg',
              width: 90.w,
              height: 90.w,
            ),

            SizedBox(height: 20.h),

            Text(
              'Password Updated!',
              style: AppTextStyles.h2,
            ),

            SizedBox(height: 12.h),

            Text(
              'Your password has been reset successfully.\nYou can now log in with your new password.',
              textAlign: TextAlign.center,
              style: AppTextStyles.bodyMedium.copyWith(
                color: AppColors.textSecondary,
                height: 1.5,
              ),
            ),

            SizedBox(height: 32.h),

            CustomButton(
              backgroundColor: AppColors.primary,
              onPressed: () {
                Navigator.pushNamedAndRemoveUntil(
                  context,
                  AppRoutes.loginscreen,
                  (route) => false,
                );
              },
              child: Text(
                'Back To Log in',
                       style: AppTextStyles.body.copyWith(color: AppColors.white),

              ),
            ),
          ],
        ),
      );
    },
  );
}