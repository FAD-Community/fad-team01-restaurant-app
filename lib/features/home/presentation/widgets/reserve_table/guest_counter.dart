import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:ka3da/core/theme/colors.dart';
import 'package:ka3da/core/theme/text_styles.dart';

class GuestCounter extends StatelessWidget {
  final int guestCount;
  final VoidCallback onIncrement;
  final VoidCallback? onDecrement;

  const GuestCounter({
    super.key,
    required this.guestCount,
    required this.onIncrement,
    this.onDecrement,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(20.r),
      ),
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 20.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'NUMBER OF GUESTS',
            style: AppTextStyles.captionMedium.copyWith(
              fontSize: 13.sp,
              fontWeight: FontWeight.w600,
              color: AppColors.textSecondary,
            ),
          ),
          Gap(16.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: onDecrement,
                child: Container(
                  height: 44.w,
                  width: 44.w,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(color: const Color(0xffE2D4C1)),
                    color: Colors.transparent,
                  ),
                  child: Icon(
                    Icons.remove,
                    size: 20.sp,
                    color: onDecrement != null
                        ? AppColors.textDark
                        : AppColors.textDark.withValues(alpha: 0.3),
                  ),
                ),
              ),
              Gap(24.w),
              Column(
                children: [
                  Text(
                    '$guestCount',
                    style: AppTextStyles.h1.copyWith(
                      fontSize: 28.sp,
                      fontWeight: FontWeight.w700,
                      color: AppColors.textDark,
                    ),
                  ),
                  Text(
                    'guests',
                    style: AppTextStyles.caption.copyWith(
                      fontSize: 12.sp,
                      color: AppColors.textMuted,
                    ),
                  ),
                ],
              ),
              Gap(24.w),
              GestureDetector(
                onTap: onIncrement,
                child: Container(
                  height: 44.w,
                  width: 44.w,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(color: const Color(0xffE2D4C1)),
                    color: Colors.transparent,
                  ),
                  child: Icon(
                    Icons.add,
                    size: 20.sp,
                    color: AppColors.textDark,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
