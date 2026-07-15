import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ka3da/core/theme/colors.dart';
import 'package:ka3da/core/theme/text_styles.dart';

class StepPill extends StatelessWidget {
  final String title;
  final bool isActive;

  const StepPill({
    super.key,
    required this.title,
    required this.isActive,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 8.h),
      decoration: BoxDecoration(
        color: isActive ? AppColors.primary : const Color(0xffEEDEC9),
        borderRadius: BorderRadius.circular(100.r),
      ),
      child: Text(
        title,
        style: AppTextStyles.captionlarge.copyWith(
          fontSize: 12.sp,
          fontWeight: isActive ? FontWeight.w600 : FontWeight.w500,
          color: isActive ? Colors.white : const Color(0xff8C7461),
        ),
      ),
    );
  }
}
