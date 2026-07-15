import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:ka3da/core/theme/colors.dart';
import 'package:ka3da/core/theme/text_styles.dart';

class TotalDepositCard extends StatelessWidget {
  final int amount;

  const TotalDepositCard({
    super.key,
    required this.amount,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(20.r),
      ),
      padding: EdgeInsets.symmetric(
        horizontal: 20.w,
        vertical: 22.h,
      ),
      child: Column(
        children: [
          Text(
            'Total Deposit',
            style: AppTextStyles.captionMedium.copyWith(
              fontSize: 14.sp,
              color: AppColors.textMuted,
            ),
          ),
          Gap(6.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.baseline,
            textBaseline: TextBaseline.alphabetic,
            children: [
              Text(
                amount.toString(),
                style: AppTextStyles.h2.copyWith(
                  fontSize: 42.sp,
                  fontWeight: FontWeight.w800,
                  color: AppColors.textDark,
                ),
              ),
              Gap(6.w),
              Text(
                'EGP',
                style: AppTextStyles.bodyMedium.copyWith(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w600,
                  color: AppColors.textSecondary,
                ),
              ),
            ],
          ),
          Gap(4.h),
          Text(
            '(Refundable upon arrival)',
            style: AppTextStyles.caption.copyWith(
              fontSize: 12.sp,
              color: AppColors.textMuted,
            ),
          ),
        ],
      ),
    );
  }
}
