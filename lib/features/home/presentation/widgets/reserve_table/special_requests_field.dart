import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:ka3da/core/theme/colors.dart';
import 'package:ka3da/core/theme/text_styles.dart';

class SpecialRequestsField extends StatelessWidget {
  final TextEditingController controller;

  const SpecialRequestsField({
    super.key,
    required this.controller,
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
            'SPECIAL REQUESTS (optional)',
            style: AppTextStyles.captionMedium.copyWith(
              fontSize: 13.sp,
              fontWeight: FontWeight.w600,
              color: AppColors.textSecondary,
            ),
          ),
          Gap(12.h),
          Container(
            decoration: BoxDecoration(
              color: const Color(0xffFFF9F6),
              borderRadius: BorderRadius.circular(12.r),
            ),
            padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
            child: TextField(
              controller: controller,
              maxLines: 4,
              style: AppTextStyles.body.copyWith(
                fontSize: 14.sp,
                color: AppColors.textDark,
              ),
              decoration: InputDecoration(
                hintText: 'Allergies, dietary needs, celebrations, seating preferences',
                hintStyle: AppTextStyles.body.copyWith(
                  fontSize: 14.sp,
                  color: AppColors.textMuted.withValues(alpha: 0.6),
                ),
                border: InputBorder.none,
                isDense: true,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
