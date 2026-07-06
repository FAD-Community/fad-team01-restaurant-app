import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:ka3da/core/theme/colors.dart';
import 'package:ka3da/core/theme/text_styles.dart';
import 'package:ka3da/features/auth/presentation/widgets/auth_gate/top_curve_clipper.dart';

class AuthGateHeader extends StatelessWidget {
  const AuthGateHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        TopCurveClipper(),

        Positioned(
          top: 119.h,
          left: 42.w,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 20.h),

              Text(
                'Qa3da',
                style: AppTextStyles.hero.copyWith(color: AppColors.white , fontSize: 42 , ),
              ),

              SizedBox(height: 12.h),

              Text(
                'Book your perfect dining\nexperience in seconds.',
                style: AppTextStyles.bodyMedium.copyWith(
                  color: AppColors.white,
                  height: 1.4.sp,
                ),
              ),

            ],
          ),
        ),
      ],
    );
  }
}
